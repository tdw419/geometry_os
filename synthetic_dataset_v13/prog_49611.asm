; DESCRIPTION: Places a white line segment connecting (110, 78) to (461, 2).
; PLAN: r0=110(x1), r1=78(y1), r2=461(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 78
LDI r2, 461
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
