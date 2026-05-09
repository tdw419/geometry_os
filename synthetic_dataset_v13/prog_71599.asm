; DESCRIPTION: Renders a purple line between points (345, 157) and (96, 246).
; PLAN: r0=345(x1), r1=157(y1), r2=96(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 157
LDI r2, 96
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
