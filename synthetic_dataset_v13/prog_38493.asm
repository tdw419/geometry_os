; DESCRIPTION: Composite: Draws a purple line from (246, 133) to (265, 232) then Renders a yellow disk with center (66, 131) and radius 38 then Sets a single white pixel at (79, 97).
; PLAN: r0=246(x1), r1=133(y1), r2=265(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=131(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=97(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 246
LDI r1, 133
LDI r2, 265
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 131
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 97
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
