; DESCRIPTION: Places a white line segment connecting (422, 77) to (396, 176).
; PLAN: r0=422(x1), r1=77(y1), r2=396(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 77
LDI r2, 396
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
