; DESCRIPTION: Renders a blue line between points (366, 4) and (177, 168).
; PLAN: r0=366(x1), r1=4(y1), r2=177(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 4
LDI r2, 177
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
