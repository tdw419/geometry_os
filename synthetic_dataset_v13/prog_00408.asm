; DESCRIPTION: Places a white line segment connecting (477, 144) to (428, 251).
; PLAN: r0=477(x1), r1=144(y1), r2=428(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 144
LDI r2, 428
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
