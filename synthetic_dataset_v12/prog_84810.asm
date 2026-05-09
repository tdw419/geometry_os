; DESCRIPTION: Renders a yellow line between points (300, 84) and (81, 194).
; PLAN: r0=300(x1), r1=84(y1), r2=81(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 84
LDI r2, 81
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
