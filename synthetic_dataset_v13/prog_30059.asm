; DESCRIPTION: Renders a yellow line between points (246, 76) and (435, 136).
; PLAN: r0=246(x1), r1=76(y1), r2=435(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 76
LDI r2, 435
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
