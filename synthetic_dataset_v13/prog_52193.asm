; DESCRIPTION: Renders a blue line between points (374, 84) and (483, 150).
; PLAN: r0=374(x1), r1=84(y1), r2=483(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 84
LDI r2, 483
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
