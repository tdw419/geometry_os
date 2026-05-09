; DESCRIPTION: Composite: Sets a single blue pixel at (30, 191) then Draws a blue line from (30, 130) to (497, 209).
; PLAN: r0=30(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=130(y1), r7=497(x2), r8=209(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 130
LDI r7, 497
LDI r8, 209
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
