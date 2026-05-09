; DESCRIPTION: Places a white line segment connecting (417, 217) to (414, 140).
; PLAN: r0=417(x1), r1=217(y1), r2=414(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 217
LDI r2, 414
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
