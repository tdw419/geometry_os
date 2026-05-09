; DESCRIPTION: Places a white line segment connecting (54, 142) to (477, 229).
; PLAN: r0=54(x1), r1=142(y1), r2=477(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 142
LDI r2, 477
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
