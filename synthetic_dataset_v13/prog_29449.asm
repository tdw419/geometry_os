; DESCRIPTION: Places a green line segment connecting (403, 201) to (99, 51).
; PLAN: r0=403(x1), r1=201(y1), r2=99(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 201
LDI r2, 99
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
