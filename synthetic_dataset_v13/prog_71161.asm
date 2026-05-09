; DESCRIPTION: Composite: Renders a blue line between points (354, 158) and (185, 55) then Places a yellow dot at position (391, 232).
; PLAN: r0=354(x1), r1=158(y1), r2=185(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=232(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 158
LDI r2, 185
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 232
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
