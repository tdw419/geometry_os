; DESCRIPTION: Renders a blue line between points (477, 157) and (442, 216).
; PLAN: r0=477(x1), r1=157(y1), r2=442(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 157
LDI r2, 442
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
