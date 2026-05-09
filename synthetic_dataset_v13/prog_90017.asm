; DESCRIPTION: Renders a blue line between points (24, 84) and (330, 214).
; PLAN: r0=24(x1), r1=84(y1), r2=330(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 84
LDI r2, 330
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
