; DESCRIPTION: Composite: Renders a purple line between points (253, 52) and (49, 175) then Sets a single magenta pixel at (456, 80).
; PLAN: r0=253(x1), r1=52(y1), r2=49(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=80(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 52
LDI r2, 49
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 80
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
