; DESCRIPTION: Renders a yellow line between points (423, 113) and (0, 189).
; PLAN: r0=423(x1), r1=113(y1), r2=0(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 113
LDI r2, 0
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
