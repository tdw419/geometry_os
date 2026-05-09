; DESCRIPTION: Composite: Draws a green circle centered at (274, 179) with radius 63 then Draws a orange rectangle at (490, 134) with width 18 and height 90.
; PLAN: r0=274(x), r1=179(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x), r6=134(y), r7=18(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 179
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 134
LDI r7, 18
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
