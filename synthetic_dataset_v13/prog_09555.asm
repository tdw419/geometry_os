; DESCRIPTION: Renders a magenta line between points (385, 244) and (88, 203).
; PLAN: r0=385(x1), r1=244(y1), r2=88(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 244
LDI r2, 88
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
