; DESCRIPTION: Places a white line segment connecting (18, 44) to (432, 14).
; PLAN: r0=18(x1), r1=44(y1), r2=432(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 44
LDI r2, 432
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
