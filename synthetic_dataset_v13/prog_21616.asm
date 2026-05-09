; DESCRIPTION: Renders a yellow line between points (435, 71) and (377, 84).
; PLAN: r0=435(x1), r1=71(y1), r2=377(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 71
LDI r2, 377
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
