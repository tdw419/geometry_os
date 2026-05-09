; DESCRIPTION: Renders a purple line between points (96, 87) and (246, 225).
; PLAN: r0=96(x1), r1=87(y1), r2=246(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 87
LDI r2, 246
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
