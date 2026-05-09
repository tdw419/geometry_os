; DESCRIPTION: Places a purple line segment connecting (265, 211) to (288, 85).
; PLAN: r0=265(x1), r1=211(y1), r2=288(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 211
LDI r2, 288
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
