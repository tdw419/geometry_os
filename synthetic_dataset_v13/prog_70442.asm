; DESCRIPTION: Composite: Sets a single black pixel at (417, 33) then Places a green line segment connecting (167, 250) to (510, 160).
; PLAN: r0=417(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=250(y1), r7=510(x2), r8=160(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 33
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 167
LDI r6, 250
LDI r7, 510
LDI r8, 160
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
