; DESCRIPTION: Renders a blue line between points (402, 31) and (377, 153).
; PLAN: r0=402(x1), r1=31(y1), r2=377(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 31
LDI r2, 377
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
