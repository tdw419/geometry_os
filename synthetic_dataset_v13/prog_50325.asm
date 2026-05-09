; DESCRIPTION: Draws a purple line from (125, 73) to (343, 65).
; PLAN: r0=125(x1), r1=73(y1), r2=343(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 73
LDI r2, 343
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
