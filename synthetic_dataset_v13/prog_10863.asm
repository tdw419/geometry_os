; DESCRIPTION: Renders a yellow line between points (462, 70) and (52, 157).
; PLAN: r0=462(x1), r1=70(y1), r2=52(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 70
LDI r2, 52
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
