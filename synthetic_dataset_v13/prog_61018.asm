; DESCRIPTION: Places a white line segment connecting (378, 234) to (331, 251).
; PLAN: r0=378(x1), r1=234(y1), r2=331(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 234
LDI r2, 331
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
