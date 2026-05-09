; DESCRIPTION: Renders a yellow line between points (54, 179) and (212, 84).
; PLAN: r0=54(x1), r1=179(y1), r2=212(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 179
LDI r2, 212
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
