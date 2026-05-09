; DESCRIPTION: Renders a blue line between points (130, 119) and (6, 108).
; PLAN: r0=130(x1), r1=119(y1), r2=6(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 119
LDI r2, 6
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
