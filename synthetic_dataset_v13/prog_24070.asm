; DESCRIPTION: Renders a yellow line between points (13, 145) and (172, 105).
; PLAN: r0=13(x1), r1=145(y1), r2=172(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 145
LDI r2, 172
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
