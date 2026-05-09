; DESCRIPTION: Composite: Draws a blue line from (504, 26) to (489, 199) then Places a purple dot at position (194, 29).
; PLAN: r0=504(x1), r1=26(y1), r2=489(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=29(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 504
LDI r1, 26
LDI r2, 489
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 29
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
