; DESCRIPTION: Composite: Renders a yellow disk with center (60, 56) and radius 41 then Draws a white rectangle at (378, 63) with width 20 and height 26 then Sets a single blue pixel at (25, 133).
; PLAN: r0=60(x), r1=56(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=63(y), r7=20(width), r8=26(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=25(x), r11=133(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 56
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 63
LDI r7, 20
LDI r8, 26
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 133
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
