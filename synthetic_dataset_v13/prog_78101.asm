; DESCRIPTION: Renders a purple line between points (60, 194) and (268, 11).
; PLAN: r0=60(x1), r1=194(y1), r2=268(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 194
LDI r2, 268
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
