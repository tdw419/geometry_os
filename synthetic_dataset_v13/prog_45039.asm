; DESCRIPTION: Places a red line segment connecting (351, 219) to (115, 11).
; PLAN: r0=351(x1), r1=219(y1), r2=115(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 219
LDI r2, 115
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
