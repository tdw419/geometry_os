; DESCRIPTION: Renders a blue line between points (125, 98) and (501, 233).
; PLAN: r0=125(x1), r1=98(y1), r2=501(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 98
LDI r2, 501
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
