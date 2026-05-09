; DESCRIPTION: Renders a blue line between points (25, 133) and (220, 139).
; PLAN: r0=25(x1), r1=133(y1), r2=220(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 133
LDI r2, 220
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
