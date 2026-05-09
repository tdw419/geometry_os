; DESCRIPTION: Renders a purple line between points (188, 178) and (273, 194).
; PLAN: r0=188(x1), r1=178(y1), r2=273(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 178
LDI r2, 273
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
