; DESCRIPTION: Renders a purple line between points (377, 127) and (268, 95).
; PLAN: r0=377(x1), r1=127(y1), r2=268(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 127
LDI r2, 268
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
