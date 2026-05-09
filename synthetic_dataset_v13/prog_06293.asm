; DESCRIPTION: Renders a purple line between points (157, 151) and (367, 118).
; PLAN: r0=157(x1), r1=151(y1), r2=367(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 151
LDI r2, 367
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
