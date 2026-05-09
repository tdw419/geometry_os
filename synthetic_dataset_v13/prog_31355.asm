; DESCRIPTION: Composite: Sets a single blue pixel at (325, 197) then Places a magenta line segment connecting (310, 102) to (106, 168).
; PLAN: r0=325(x), r1=197(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=102(y1), r7=106(x2), r8=168(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 197
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 102
LDI r7, 106
LDI r8, 168
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
