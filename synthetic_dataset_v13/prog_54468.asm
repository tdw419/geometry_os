; DESCRIPTION: Renders a yellow line between points (203, 181) and (341, 145).
; PLAN: r0=203(x1), r1=181(y1), r2=341(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 181
LDI r2, 341
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
