; DESCRIPTION: Renders a purple line between points (66, 19) and (259, 159).
; PLAN: r0=66(x1), r1=19(y1), r2=259(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 19
LDI r2, 259
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
