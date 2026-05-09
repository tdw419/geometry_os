; DESCRIPTION: Places a cyan line segment connecting (388, 227) to (351, 189).
; PLAN: r0=388(x1), r1=227(y1), r2=351(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 227
LDI r2, 351
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
