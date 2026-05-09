; DESCRIPTION: Places a black line segment connecting (270, 252) to (417, 248).
; PLAN: r0=270(x1), r1=252(y1), r2=417(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 252
LDI r2, 417
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
