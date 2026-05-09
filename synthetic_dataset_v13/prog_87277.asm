; DESCRIPTION: Composite: Draws a purple line from (256, 148) to (490, 92) then Sets a single white pixel at (159, 148).
; PLAN: r0=256(x1), r1=148(y1), r2=490(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=148(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 256
LDI r1, 148
LDI r2, 490
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 148
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
