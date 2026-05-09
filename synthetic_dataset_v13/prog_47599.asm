; DESCRIPTION: Composite: Sets a single blue pixel at (3, 238) then Renders a white disk with center (389, 37) and radius 35 then Draws a green rectangle at (116, 96) with width 17 and height 70.
; PLAN: r0=3(x), r1=238(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=37(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=116(x), r11=96(y), r12=17(width), r13=70(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 3
LDI r1, 238
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 37
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 116
LDI r11, 96
LDI r12, 17
LDI r13, 70
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
