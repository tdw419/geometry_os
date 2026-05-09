; DESCRIPTION: Renders a blue line between points (358, 149) and (282, 30).
; PLAN: r0=358(x1), r1=149(y1), r2=282(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 149
LDI r2, 282
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
