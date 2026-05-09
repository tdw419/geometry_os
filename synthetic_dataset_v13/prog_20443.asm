; DESCRIPTION: Renders a green line between points (414, 121) and (165, 136).
; PLAN: r0=414(x1), r1=121(y1), r2=165(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 121
LDI r2, 165
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
