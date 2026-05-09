; DESCRIPTION: Renders a purple line between points (280, 148) and (167, 158).
; PLAN: r0=280(x1), r1=148(y1), r2=167(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 148
LDI r2, 167
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
