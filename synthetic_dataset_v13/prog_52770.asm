; DESCRIPTION: Composite: Renders a purple line between points (90, 203) and (494, 188) then Sets a single magenta pixel at (14, 91).
; PLAN: r0=90(x1), r1=203(y1), r2=494(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=91(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 203
LDI r2, 494
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 91
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
