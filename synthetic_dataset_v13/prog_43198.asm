; DESCRIPTION: Renders a purple line between points (472, 188) and (441, 178).
; PLAN: r0=472(x1), r1=188(y1), r2=441(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 188
LDI r2, 441
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
