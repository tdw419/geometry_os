; DESCRIPTION: Composite: Renders a black disk with center (65, 109) and radius 22 then Draws a white rectangle at (446, 33) with width 53 and height 63 then Sets a single blue pixel at (56, 52).
; PLAN: r0=65(x), r1=109(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=33(y), r7=53(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x), r11=52(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 109
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 33
LDI r7, 53
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 52
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
