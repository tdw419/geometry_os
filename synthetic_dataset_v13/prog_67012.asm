; DESCRIPTION: Renders a yellow line between points (193, 34) and (95, 105).
; PLAN: r0=193(x1), r1=34(y1), r2=95(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 34
LDI r2, 95
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
