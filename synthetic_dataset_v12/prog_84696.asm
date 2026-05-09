; DESCRIPTION: Renders a blue line between points (37, 238) and (87, 22).
; PLAN: r0=37(x1), r1=238(y1), r2=87(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 238
LDI r2, 87
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
