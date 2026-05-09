; DESCRIPTION: Composite: Draws a green rectangle at (493, 216) with width 11 and height 29 then Draws a blue circle centered at (321, 139) with radius 45.
; PLAN: r0=493(x), r1=216(y), r2=11(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=139(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 216
LDI r2, 11
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 139
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
