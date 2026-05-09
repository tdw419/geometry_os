; DESCRIPTION: Renders a blue line between points (372, 49) and (372, 203).
; PLAN: r0=372(x1), r1=49(y1), r2=372(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 49
LDI r2, 372
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
