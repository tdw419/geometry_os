; DESCRIPTION: Places a blue line segment connecting (487, 194) to (486, 201).
; PLAN: r0=487(x1), r1=194(y1), r2=486(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 194
LDI r2, 486
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
