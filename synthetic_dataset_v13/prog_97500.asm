; DESCRIPTION: Composite: Renders a black disk with center (424, 155) and radius 34 then Draws a blue rectangle at (335, 29) with width 73 and height 46 then Sets a single purple pixel at (76, 71).
; PLAN: r0=424(x), r1=155(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=29(y), r7=73(width), r8=46(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=71(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 155
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 29
LDI r7, 73
LDI r8, 46
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 71
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
