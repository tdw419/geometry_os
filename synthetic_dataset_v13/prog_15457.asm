; DESCRIPTION: Places a purple line segment connecting (439, 45) to (54, 191).
; PLAN: r0=439(x1), r1=45(y1), r2=54(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 45
LDI r2, 54
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
