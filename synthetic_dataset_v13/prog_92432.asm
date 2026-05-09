; DESCRIPTION: Renders a blue line between points (282, 206) and (377, 200).
; PLAN: r0=282(x1), r1=206(y1), r2=377(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 206
LDI r2, 377
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
