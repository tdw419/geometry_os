; DESCRIPTION: Places a purple line segment connecting (292, 78) to (233, 77).
; PLAN: r0=292(x1), r1=78(y1), r2=233(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 78
LDI r2, 233
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
