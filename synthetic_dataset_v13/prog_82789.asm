; DESCRIPTION: Renders a purple line between points (498, 110) and (82, 226).
; PLAN: r0=498(x1), r1=110(y1), r2=82(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 110
LDI r2, 82
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
