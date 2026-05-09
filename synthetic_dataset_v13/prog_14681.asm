; DESCRIPTION: Renders a yellow line between points (76, 170) and (164, 227).
; PLAN: r0=76(x1), r1=170(y1), r2=164(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 170
LDI r2, 164
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
