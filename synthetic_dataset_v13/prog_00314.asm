; DESCRIPTION: Renders a blue line between points (159, 87) and (9, 15).
; PLAN: r0=159(x1), r1=87(y1), r2=9(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 87
LDI r2, 9
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
