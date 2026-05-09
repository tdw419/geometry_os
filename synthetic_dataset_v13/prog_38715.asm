; DESCRIPTION: Composite: Draws a black line from (181, 69) to (498, 247) then Places a yellow dot at position (119, 110).
; PLAN: r0=181(x1), r1=69(y1), r2=498(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=110(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 69
LDI r2, 498
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 110
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
