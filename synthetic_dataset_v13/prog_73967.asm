; DESCRIPTION: Composite: Sets a single blue pixel at (174, 110) then Renders a purple box of size 54x93 starting at (257, 104).
; PLAN: r0=174(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=104(y), r7=54(width), r8=93(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 104
LDI r7, 54
LDI r8, 93
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
