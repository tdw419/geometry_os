; DESCRIPTION: Renders a green line between points (407, 219) and (351, 98).
; PLAN: r0=407(x1), r1=219(y1), r2=351(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 219
LDI r2, 351
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
