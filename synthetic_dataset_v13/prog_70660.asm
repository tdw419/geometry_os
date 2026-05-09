; DESCRIPTION: Renders a yellow line between points (100, 22) and (270, 87).
; PLAN: r0=100(x1), r1=22(y1), r2=270(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 22
LDI r2, 270
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
