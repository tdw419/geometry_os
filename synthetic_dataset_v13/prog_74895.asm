; DESCRIPTION: Renders a green line between points (427, 105) and (139, 5).
; PLAN: r0=427(x1), r1=105(y1), r2=139(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 105
LDI r2, 139
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
