; DESCRIPTION: Places a white line segment connecting (422, 162) to (472, 23).
; PLAN: r0=422(x1), r1=162(y1), r2=472(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 162
LDI r2, 472
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
