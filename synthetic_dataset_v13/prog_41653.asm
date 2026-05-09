; DESCRIPTION: Places a green line segment connecting (130, 234) to (155, 76).
; PLAN: r0=130(x1), r1=234(y1), r2=155(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 234
LDI r2, 155
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
