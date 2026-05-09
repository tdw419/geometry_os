; DESCRIPTION: Renders a purple line between points (88, 174) and (362, 168).
; PLAN: r0=88(x1), r1=174(y1), r2=362(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 174
LDI r2, 362
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
