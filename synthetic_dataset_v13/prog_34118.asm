; DESCRIPTION: Composite: Draws a blue line from (163, 68) to (232, 106) then Places a blue dot at position (407, 43).
; PLAN: r0=163(x1), r1=68(y1), r2=232(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=43(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 68
LDI r2, 232
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 43
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
