; DESCRIPTION: Composite: Sets a single blue pixel at (338, 21) then Draws a black rectangle at (419, 187) with width 43 and height 66.
; PLAN: r0=338(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=187(y), r7=43(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 187
LDI r7, 43
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
