; DESCRIPTION: Places a white line segment connecting (400, 59) to (421, 145).
; PLAN: r0=400(x1), r1=59(y1), r2=421(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 59
LDI r2, 421
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
