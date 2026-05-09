; DESCRIPTION: Renders a white line between points (100, 119) and (427, 46).
; PLAN: r0=100(x1), r1=119(y1), r2=427(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 119
LDI r2, 427
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
