; DESCRIPTION: Renders a purple line between points (217, 212) and (419, 219).
; PLAN: r0=217(x1), r1=212(y1), r2=419(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 212
LDI r2, 419
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
