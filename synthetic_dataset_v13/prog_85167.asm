; DESCRIPTION: Places a purple line segment connecting (10, 78) to (229, 223).
; PLAN: r0=10(x1), r1=78(y1), r2=229(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 78
LDI r2, 229
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
