; DESCRIPTION: Places a white line segment connecting (318, 232) to (134, 32).
; PLAN: r0=318(x1), r1=232(y1), r2=134(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 232
LDI r2, 134
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
