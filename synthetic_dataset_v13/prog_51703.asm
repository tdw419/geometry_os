; DESCRIPTION: Places a white line segment connecting (432, 6) to (407, 168).
; PLAN: r0=432(x1), r1=6(y1), r2=407(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 6
LDI r2, 407
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
