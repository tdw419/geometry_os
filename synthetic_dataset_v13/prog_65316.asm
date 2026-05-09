; DESCRIPTION: Renders a blue line between points (358, 170) and (358, 55).
; PLAN: r0=358(x1), r1=170(y1), r2=358(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 170
LDI r2, 358
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
