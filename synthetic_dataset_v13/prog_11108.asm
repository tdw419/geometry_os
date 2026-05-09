; DESCRIPTION: Composite: Places a orange dot at position (496, 90) then Places a green line segment connecting (461, 225) to (142, 11) then Renders a black disk with center (406, 63) and radius 48.
; PLAN: r0=496(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=225(y1), r7=142(x2), r8=11(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=63(y), r12=48(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 496
LDI r1, 90
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 461
LDI r6, 225
LDI r7, 142
LDI r8, 11
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 63
LDI r12, 48
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
