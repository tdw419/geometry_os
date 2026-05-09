; DESCRIPTION: Composite: Draws a purple circle centered at (292, 192) with radius 39 then Places a blue dot at position (75, 90).
; PLAN: r0=292(x), r1=192(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=90(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 292
LDI r1, 192
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 90
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
