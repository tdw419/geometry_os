; DESCRIPTION: Places a green line segment connecting (419, 136) to (286, 157).
; PLAN: r0=419(x1), r1=136(y1), r2=286(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 136
LDI r2, 286
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
