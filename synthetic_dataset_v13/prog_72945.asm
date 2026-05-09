; DESCRIPTION: Renders a blue line between points (290, 89) and (290, 203).
; PLAN: r0=290(x1), r1=89(y1), r2=290(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 89
LDI r2, 290
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
