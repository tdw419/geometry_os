; DESCRIPTION: Places a green line segment connecting (423, 24) to (508, 189).
; PLAN: r0=423(x1), r1=24(y1), r2=508(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 24
LDI r2, 508
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
