; DESCRIPTION: Renders a purple line between points (180, 140) and (25, 55).
; PLAN: r0=180(x1), r1=140(y1), r2=25(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 140
LDI r2, 25
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
