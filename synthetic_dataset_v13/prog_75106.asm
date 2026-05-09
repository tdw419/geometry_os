; DESCRIPTION: Renders a blue line between points (503, 73) and (86, 122).
; PLAN: r0=503(x1), r1=73(y1), r2=86(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 73
LDI r2, 86
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
