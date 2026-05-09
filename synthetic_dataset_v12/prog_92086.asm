; DESCRIPTION: Renders a blue line between points (359, 69) and (388, 134).
; PLAN: r0=359(x1), r1=69(y1), r2=388(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 69
LDI r2, 388
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
