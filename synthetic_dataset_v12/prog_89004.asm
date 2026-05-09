; DESCRIPTION: Places a white line segment connecting (402, 96) to (432, 238).
; PLAN: r0=402(x1), r1=96(y1), r2=432(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 96
LDI r2, 432
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
