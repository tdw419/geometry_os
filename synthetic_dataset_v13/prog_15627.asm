; DESCRIPTION: Places a green line segment connecting (496, 140) to (211, 119).
; PLAN: r0=496(x1), r1=140(y1), r2=211(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 140
LDI r2, 211
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
