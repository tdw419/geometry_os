; DESCRIPTION: Renders a purple line between points (212, 53) and (271, 51).
; PLAN: r0=212(x1), r1=53(y1), r2=271(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 53
LDI r2, 271
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
