; DESCRIPTION: Composite: Draws a white rectangle at (289, 115) with width 62 and height 95 then Renders a purple disk with center (458, 43) and radius 17 then Sets a single white pixel at (115, 252).
; PLAN: r0=289(x), r1=115(y), r2=62(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=43(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x), r11=252(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 115
LDI r2, 62
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 43
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 252
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
