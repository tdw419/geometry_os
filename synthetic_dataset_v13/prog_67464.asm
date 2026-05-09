; DESCRIPTION: Places a white line segment connecting (198, 70) to (363, 105).
; PLAN: r0=198(x1), r1=70(y1), r2=363(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 70
LDI r2, 363
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
