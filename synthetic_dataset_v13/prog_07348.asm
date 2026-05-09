; DESCRIPTION: Renders a purple line between points (434, 19) and (49, 31).
; PLAN: r0=434(x1), r1=19(y1), r2=49(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 19
LDI r2, 49
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
