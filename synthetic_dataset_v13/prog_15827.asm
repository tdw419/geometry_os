; DESCRIPTION: Renders a purple line between points (511, 174) and (228, 216).
; PLAN: r0=511(x1), r1=174(y1), r2=228(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 174
LDI r2, 228
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
