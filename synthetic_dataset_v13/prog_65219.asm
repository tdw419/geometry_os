; DESCRIPTION: Composite: Sets a single black pixel at (263, 150) then Places a red 66x90 rectangle at position (170, 16) then Places a red line segment connecting (4, 61) to (328, 1).
; PLAN: r0=263(x), r1=150(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=16(y), r7=66(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=4(x1), r11=61(y1), r12=328(x2), r13=1(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 150
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 170
LDI r6, 16
LDI r7, 66
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 61
LDI r12, 328
LDI r13, 1
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
