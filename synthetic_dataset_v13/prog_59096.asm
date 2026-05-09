; DESCRIPTION: Composite: Draws a purple rectangle at (388, 23) with width 36 and height 36 then Renders a white disk with center (335, 57) and radius 45.
; PLAN: r0=388(x), r1=23(y), r2=36(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=57(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 23
LDI r2, 36
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 57
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
