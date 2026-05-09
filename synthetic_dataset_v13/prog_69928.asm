; DESCRIPTION: Composite: Sets a single yellow pixel at (98, 172) then Draws a purple rectangle at (3, 147) with width 66 and height 74 then Renders a white disk with center (122, 61) and radius 38.
; PLAN: r0=98(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=147(y), r7=66(width), r8=74(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=61(y), r12=38(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 3
LDI r6, 147
LDI r7, 66
LDI r8, 74
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 61
LDI r12, 38
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
