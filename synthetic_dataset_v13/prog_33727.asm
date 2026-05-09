; DESCRIPTION: Places a green line segment connecting (178, 142) to (250, 157).
; PLAN: r0=178(x1), r1=142(y1), r2=250(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 142
LDI r2, 250
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
