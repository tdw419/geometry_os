; DESCRIPTION: Composite: Places a black dot at position (86, 60) then Renders a black box of size 86x11 starting at (411, 99) then Places a blue line segment connecting (329, 154) to (15, 81).
; PLAN: r0=86(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=99(y), r7=86(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x1), r11=154(y1), r12=15(x2), r13=81(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 411
LDI r6, 99
LDI r7, 86
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 154
LDI r12, 15
LDI r13, 81
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
