; DESCRIPTION: Renders a purple line between points (270, 76) and (82, 251).
; PLAN: r0=270(x1), r1=76(y1), r2=82(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 76
LDI r2, 82
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
