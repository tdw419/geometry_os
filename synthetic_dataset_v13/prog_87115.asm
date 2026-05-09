; DESCRIPTION: Renders a orange line between points (98, 112) and (188, 25).
; PLAN: r0=98(x1), r1=112(y1), r2=188(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 112
LDI r2, 188
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
