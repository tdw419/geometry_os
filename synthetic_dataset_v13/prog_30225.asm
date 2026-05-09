; DESCRIPTION: Renders a green line between points (385, 181) and (136, 241).
; PLAN: r0=385(x1), r1=181(y1), r2=136(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 181
LDI r2, 136
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
