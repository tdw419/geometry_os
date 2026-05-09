; DESCRIPTION: Composite: Renders a blue line between points (142, 69) and (389, 186) then Sets a single blue pixel at (460, 122).
; PLAN: r0=142(x1), r1=69(y1), r2=389(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=122(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 142
LDI r1, 69
LDI r2, 389
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 122
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
