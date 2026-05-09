; DESCRIPTION: Places a green line segment connecting (189, 219) to (286, 119).
; PLAN: r0=189(x1), r1=219(y1), r2=286(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 219
LDI r2, 286
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
