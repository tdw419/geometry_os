; DESCRIPTION: Renders a purple line between points (461, 248) and (307, 106).
; PLAN: r0=461(x1), r1=248(y1), r2=307(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 248
LDI r2, 307
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
