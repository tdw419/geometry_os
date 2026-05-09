; DESCRIPTION: Renders a yellow line between points (6, 134) and (203, 119).
; PLAN: r0=6(x1), r1=134(y1), r2=203(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 134
LDI r2, 203
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
