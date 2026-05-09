; DESCRIPTION: Composite: Draws a magenta circle centered at (126, 126) with radius 55 then Draws a purple rectangle at (422, 78) with width 54 and height 75.
; PLAN: r0=126(x), r1=126(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=78(y), r7=54(width), r8=75(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 126
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 78
LDI r7, 54
LDI r8, 75
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
