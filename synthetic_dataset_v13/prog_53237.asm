; DESCRIPTION: Places a white line segment connecting (428, 18) to (61, 85).
; PLAN: r0=428(x1), r1=18(y1), r2=61(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 18
LDI r2, 61
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
