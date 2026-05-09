; DESCRIPTION: Composite: Sets a single blue pixel at (451, 184) then Draws a blue rectangle at (246, 95) with width 111 and height 23.
; PLAN: r0=451(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=95(y), r7=111(width), r8=23(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 95
LDI r7, 111
LDI r8, 23
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
