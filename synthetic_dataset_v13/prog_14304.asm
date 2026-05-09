; DESCRIPTION: Renders a purple line between points (443, 165) and (441, 219).
; PLAN: r0=443(x1), r1=165(y1), r2=441(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 165
LDI r2, 441
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
