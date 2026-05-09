; DESCRIPTION: Places a white line segment connecting (356, 125) to (325, 245).
; PLAN: r0=356(x1), r1=125(y1), r2=325(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 125
LDI r2, 325
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
