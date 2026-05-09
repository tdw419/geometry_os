; DESCRIPTION: Renders a purple line between points (179, 156) and (230, 164).
; PLAN: r0=179(x1), r1=156(y1), r2=230(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 156
LDI r2, 230
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
