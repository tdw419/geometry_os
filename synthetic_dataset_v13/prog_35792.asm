; DESCRIPTION: Composite: Draws a black line from (505, 153) to (511, 76) then Places a purple dot at position (382, 212).
; PLAN: r0=505(x1), r1=153(y1), r2=511(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=212(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 505
LDI r1, 153
LDI r2, 511
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 212
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
