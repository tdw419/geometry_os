; DESCRIPTION: Renders a black line between points (216, 108) and (442, 159).
; PLAN: r0=216(x1), r1=108(y1), r2=442(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 108
LDI r2, 442
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
