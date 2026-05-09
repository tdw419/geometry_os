; DESCRIPTION: Renders a yellow line between points (453, 89) and (123, 212).
; PLAN: r0=453(x1), r1=89(y1), r2=123(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 89
LDI r2, 123
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
