; DESCRIPTION: Renders a blue line between points (216, 195) and (442, 250).
; PLAN: r0=216(x1), r1=195(y1), r2=442(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 195
LDI r2, 442
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
