; DESCRIPTION: Places a white line segment connecting (351, 110) to (374, 199).
; PLAN: r0=351(x1), r1=110(y1), r2=374(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 110
LDI r2, 374
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
