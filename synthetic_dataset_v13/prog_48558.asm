; DESCRIPTION: Places a green line segment connecting (109, 148) to (436, 185).
; PLAN: r0=109(x1), r1=148(y1), r2=436(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 148
LDI r2, 436
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
