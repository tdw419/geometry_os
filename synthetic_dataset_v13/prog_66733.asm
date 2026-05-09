; DESCRIPTION: Places a white line segment connecting (335, 201) to (378, 195).
; PLAN: r0=335(x1), r1=201(y1), r2=378(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 201
LDI r2, 378
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
