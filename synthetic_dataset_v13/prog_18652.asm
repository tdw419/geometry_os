; DESCRIPTION: Renders a purple line between points (159, 61) and (182, 94).
; PLAN: r0=159(x1), r1=61(y1), r2=182(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 61
LDI r2, 182
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
