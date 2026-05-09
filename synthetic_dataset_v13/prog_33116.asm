; DESCRIPTION: Renders a yellow line between points (76, 181) and (372, 136).
; PLAN: r0=76(x1), r1=181(y1), r2=372(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 181
LDI r2, 372
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
