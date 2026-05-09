; DESCRIPTION: Renders a purple line between points (315, 39) and (263, 1).
; PLAN: r0=315(x1), r1=39(y1), r2=263(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 39
LDI r2, 263
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
