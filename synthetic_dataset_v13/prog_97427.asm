; DESCRIPTION: Renders a purple line between points (129, 188) and (217, 106).
; PLAN: r0=129(x1), r1=188(y1), r2=217(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 188
LDI r2, 217
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
