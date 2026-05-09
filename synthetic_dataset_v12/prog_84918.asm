; DESCRIPTION: Renders a yellow line between points (321, 91) and (462, 105).
; PLAN: r0=321(x1), r1=91(y1), r2=462(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 91
LDI r2, 462
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
