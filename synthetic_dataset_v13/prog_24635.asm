; DESCRIPTION: Renders a purple line between points (421, 106) and (167, 105).
; PLAN: r0=421(x1), r1=106(y1), r2=167(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 106
LDI r2, 167
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
