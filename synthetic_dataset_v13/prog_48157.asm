; DESCRIPTION: Places a white line segment connecting (315, 251) to (416, 78).
; PLAN: r0=315(x1), r1=251(y1), r2=416(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 251
LDI r2, 416
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
