; DESCRIPTION: Places a black line segment connecting (158, 61) to (325, 241).
; PLAN: r0=158(x1), r1=61(y1), r2=325(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 61
LDI r2, 325
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
