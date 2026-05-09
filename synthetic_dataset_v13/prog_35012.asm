; DESCRIPTION: Renders a blue line between points (184, 142) and (459, 161).
; PLAN: r0=184(x1), r1=142(y1), r2=459(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 142
LDI r2, 459
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
