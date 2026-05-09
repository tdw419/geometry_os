; DESCRIPTION: Composite: Places a magenta 117x16 rectangle at position (341, 204) then Places a red dot at position (101, 162) then Places a black line segment connecting (476, 178) to (89, 154).
; PLAN: r0=341(x), r1=204(y), r2=117(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=162(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=476(x1), r11=178(y1), r12=89(x2), r13=154(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 204
LDI r2, 117
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 162
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 476
LDI r11, 178
LDI r12, 89
LDI r13, 154
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
