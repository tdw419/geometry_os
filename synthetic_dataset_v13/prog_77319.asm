; DESCRIPTION: Places a green line segment connecting (61, 148) to (142, 147).
; PLAN: r0=61(x1), r1=148(y1), r2=142(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 148
LDI r2, 142
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
