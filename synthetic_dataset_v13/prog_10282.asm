; DESCRIPTION: Places a white line segment connecting (335, 56) to (428, 1).
; PLAN: r0=335(x1), r1=56(y1), r2=428(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 56
LDI r2, 428
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
