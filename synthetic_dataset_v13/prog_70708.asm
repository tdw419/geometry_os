; DESCRIPTION: Composite: Draws a black line from (391, 11) to (165, 62) then Places a purple dot at position (294, 172).
; PLAN: r0=391(x1), r1=11(y1), r2=165(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=172(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 11
LDI r2, 165
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 172
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
