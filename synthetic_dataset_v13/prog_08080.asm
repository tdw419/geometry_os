; DESCRIPTION: Places a green line segment connecting (172, 250) to (227, 99).
; PLAN: r0=172(x1), r1=250(y1), r2=227(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 250
LDI r2, 227
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
