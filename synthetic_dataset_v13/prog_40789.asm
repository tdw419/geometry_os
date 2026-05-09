; DESCRIPTION: Renders a purple line between points (193, 200) and (464, 139).
; PLAN: r0=193(x1), r1=200(y1), r2=464(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 200
LDI r2, 464
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
