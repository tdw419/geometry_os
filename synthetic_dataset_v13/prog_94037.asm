; DESCRIPTION: Renders a black line between points (451, 35) and (120, 67).
; PLAN: r0=451(x1), r1=35(y1), r2=120(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 35
LDI r2, 120
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
