; DESCRIPTION: Renders a purple line between points (181, 79) and (82, 97).
; PLAN: r0=181(x1), r1=79(y1), r2=82(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 79
LDI r2, 82
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
