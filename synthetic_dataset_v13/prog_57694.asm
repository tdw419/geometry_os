; DESCRIPTION: Renders a yellow line between points (149, 100) and (115, 26).
; PLAN: r0=149(x1), r1=100(y1), r2=115(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 100
LDI r2, 115
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
