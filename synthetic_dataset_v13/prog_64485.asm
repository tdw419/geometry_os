; DESCRIPTION: Renders a purple line between points (456, 43) and (276, 141).
; PLAN: r0=456(x1), r1=43(y1), r2=276(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 43
LDI r2, 276
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
