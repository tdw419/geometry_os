; DESCRIPTION: Composite: Draws a green rectangle at (309, 17) with width 65 and height 80 then Sets a single blue pixel at (239, 19) then Renders a black disk with center (322, 110) and radius 57.
; PLAN: r0=309(x), r1=17(y), r2=65(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x), r6=19(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=322(x), r11=110(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 17
LDI r2, 65
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 19
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 322
LDI r11, 110
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
