; DESCRIPTION: Renders a yellow line between points (138, 10) and (12, 97).
; PLAN: r0=138(x1), r1=10(y1), r2=12(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 10
LDI r2, 12
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
