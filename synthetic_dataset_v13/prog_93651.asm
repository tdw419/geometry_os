; DESCRIPTION: Renders a blue line between points (39, 37) and (432, 122).
; PLAN: r0=39(x1), r1=37(y1), r2=432(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 37
LDI r2, 432
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
