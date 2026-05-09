; DESCRIPTION: Places a green line segment connecting (186, 250) to (134, 201).
; PLAN: r0=186(x1), r1=250(y1), r2=134(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 250
LDI r2, 134
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
