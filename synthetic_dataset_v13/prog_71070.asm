; DESCRIPTION: Renders a purple line between points (183, 43) and (153, 120).
; PLAN: r0=183(x1), r1=43(y1), r2=153(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 43
LDI r2, 153
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
