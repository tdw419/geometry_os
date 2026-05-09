; DESCRIPTION: Composite: Draws a white circle centered at (366, 71) with radius 18 then Draws a blue rectangle at (358, 123) with width 17 and height 101 then Sets a single green pixel at (506, 211).
; PLAN: r0=366(x), r1=71(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=123(y), r7=17(width), r8=101(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x), r11=211(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 71
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 123
LDI r7, 17
LDI r8, 101
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 211
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
