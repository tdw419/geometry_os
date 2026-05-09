; DESCRIPTION: Composite: Sets a single blue pixel at (511, 40) then Draws a green rectangle at (317, 16) with width 78 and height 62.
; PLAN: r0=511(x), r1=40(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=16(y), r7=78(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 511
LDI r1, 40
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 317
LDI r6, 16
LDI r7, 78
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
