; DESCRIPTION: Renders a blue line between points (287, 93) and (432, 127).
; PLAN: r0=287(x1), r1=93(y1), r2=432(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 93
LDI r2, 432
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
