; DESCRIPTION: Composite: Sets a single blue pixel at (191, 56) then Places a cyan line segment connecting (4, 107) to (508, 224).
; PLAN: r0=191(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=107(y1), r7=508(x2), r8=224(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 56
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 107
LDI r7, 508
LDI r8, 224
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
