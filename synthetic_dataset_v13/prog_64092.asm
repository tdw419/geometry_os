; DESCRIPTION: Places a green line segment connecting (462, 100) to (508, 176).
; PLAN: r0=462(x1), r1=100(y1), r2=508(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 100
LDI r2, 508
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
