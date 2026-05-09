; DESCRIPTION: Renders a purple line between points (98, 183) and (332, 144).
; PLAN: r0=98(x1), r1=183(y1), r2=332(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 183
LDI r2, 332
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
