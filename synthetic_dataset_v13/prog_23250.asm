; DESCRIPTION: Composite: Places a cyan line segment connecting (176, 166) to (408, 2) then Sets a single blue pixel at (257, 139).
; PLAN: r0=176(x1), r1=166(y1), r2=408(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=139(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 176
LDI r1, 166
LDI r2, 408
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 139
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
