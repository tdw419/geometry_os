; DESCRIPTION: Renders a black line between points (3, 170) and (423, 157).
; PLAN: r0=3(x1), r1=170(y1), r2=423(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 170
LDI r2, 423
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
