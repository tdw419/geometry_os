; DESCRIPTION: Renders a purple line between points (58, 183) and (196, 183).
; PLAN: r0=58(x1), r1=183(y1), r2=196(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 183
LDI r2, 196
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
