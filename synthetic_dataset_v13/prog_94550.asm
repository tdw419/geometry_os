; DESCRIPTION: Places a white line segment connecting (504, 136) to (301, 80).
; PLAN: r0=504(x1), r1=136(y1), r2=301(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 136
LDI r2, 301
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
