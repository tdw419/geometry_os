; DESCRIPTION: Places a green line segment connecting (119, 181) to (83, 25).
; PLAN: r0=119(x1), r1=181(y1), r2=83(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 181
LDI r2, 83
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
