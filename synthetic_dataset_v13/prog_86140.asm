; DESCRIPTION: Composite: Sets a single blue pixel at (126, 201) then Renders a black box of size 18x18 starting at (484, 166).
; PLAN: r0=126(x), r1=201(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=484(x), r6=166(y), r7=18(width), r8=18(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 201
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 484
LDI r6, 166
LDI r7, 18
LDI r8, 18
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
