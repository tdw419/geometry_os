; DESCRIPTION: Renders a blue line between points (72, 214) and (211, 184).
; PLAN: r0=72(x1), r1=214(y1), r2=211(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 214
LDI r2, 211
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
