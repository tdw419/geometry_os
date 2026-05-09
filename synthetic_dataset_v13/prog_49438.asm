; DESCRIPTION: Composite: Sets a single blue pixel at (191, 179) then Draws a green rectangle at (3, 43) with width 89 and height 49.
; PLAN: r0=191(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=43(y), r7=89(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 43
LDI r7, 89
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
