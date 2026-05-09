; DESCRIPTION: Renders a blue line between points (442, 122) and (476, 46).
; PLAN: r0=442(x1), r1=122(y1), r2=476(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 122
LDI r2, 476
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
