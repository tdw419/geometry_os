; DESCRIPTION: Composite: Draws a red line from (250, 43) to (506, 92) then Places a black dot at position (62, 225).
; PLAN: r0=250(x1), r1=43(y1), r2=506(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=225(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 43
LDI r2, 506
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 225
LDI r7, 0x000000
PSET r5, r6, r7
HALT
