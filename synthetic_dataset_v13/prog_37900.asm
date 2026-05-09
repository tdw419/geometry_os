; DESCRIPTION: Places a yellow line segment connecting (419, 74) to (20, 78).
; PLAN: r0=419(x1), r1=74(y1), r2=20(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 74
LDI r2, 20
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
