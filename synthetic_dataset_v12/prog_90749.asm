; DESCRIPTION: Composite: Renders a green box of size 119x112 starting at (83, 17) then Places a blue dot at position (421, 10) then Draws a blue circle centered at (233, 78) with radius 78.
; PLAN: r0=83(x), r1=17(y), r2=119(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=10(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=233(x), r11=78(y), r12=78(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 17
LDI r2, 119
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 10
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 233
LDI r11, 78
LDI r12, 78
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
