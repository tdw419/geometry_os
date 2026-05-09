; DESCRIPTION: Composite: Places a magenta line segment connecting (453, 12) to (199, 201) then Sets a single green pixel at (445, 161).
; PLAN: r0=453(x1), r1=12(y1), r2=199(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=161(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 12
LDI r2, 199
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 161
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
