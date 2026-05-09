; DESCRIPTION: Renders a blue line between points (359, 187) and (282, 224).
; PLAN: r0=359(x1), r1=187(y1), r2=282(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 187
LDI r2, 282
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
