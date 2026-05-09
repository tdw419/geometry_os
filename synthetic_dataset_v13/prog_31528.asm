; DESCRIPTION: Renders a blue line between points (245, 189) and (287, 206).
; PLAN: r0=245(x1), r1=189(y1), r2=287(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 189
LDI r2, 287
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
