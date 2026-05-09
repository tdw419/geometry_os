; DESCRIPTION: Composite: Draws a yellow line from (272, 198) to (238, 199) then Places a purple dot at position (87, 53).
; PLAN: r0=272(x1), r1=198(y1), r2=238(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=53(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 198
LDI r2, 238
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 53
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
