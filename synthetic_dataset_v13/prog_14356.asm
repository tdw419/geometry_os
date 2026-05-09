; DESCRIPTION: Composite: Sets a single blue pixel at (489, 136) then Renders a blue box of size 36x45 starting at (311, 81).
; PLAN: r0=489(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=81(y), r7=36(width), r8=45(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 489
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 81
LDI r7, 36
LDI r8, 45
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
