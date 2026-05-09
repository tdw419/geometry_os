; DESCRIPTION: Composite: Places a magenta dot at position (47, 20) then Places a purple line segment connecting (137, 114) to (505, 63) then Renders a black disk with center (344, 92) and radius 34.
; PLAN: r0=47(x), r1=20(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=137(x1), r6=114(y1), r7=505(x2), r8=63(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=92(y), r12=34(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 20
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 114
LDI r7, 505
LDI r8, 63
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 92
LDI r12, 34
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
