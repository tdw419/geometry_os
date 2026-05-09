; DESCRIPTION: Places a white line segment connecting (78, 61) to (278, 200).
; PLAN: r0=78(x1), r1=61(y1), r2=278(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 61
LDI r2, 278
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
