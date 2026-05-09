; DESCRIPTION: Places a orange line segment connecting (478, 21) to (233, 180).
; PLAN: r0=478(x1), r1=21(y1), r2=233(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 21
LDI r2, 233
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
