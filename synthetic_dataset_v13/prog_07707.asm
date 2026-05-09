; DESCRIPTION: Composite: Places a magenta dot at position (325, 144) then Places a orange line segment connecting (498, 142) to (205, 242) then Renders a blue disk with center (339, 153) and radius 69.
; PLAN: r0=325(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=498(x1), r6=142(y1), r7=205(x2), r8=242(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=153(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 498
LDI r6, 142
LDI r7, 205
LDI r8, 242
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 153
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
