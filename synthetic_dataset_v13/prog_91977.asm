; DESCRIPTION: Composite: Draws a purple circle centered at (278, 135) with radius 50 then Places a yellow dot at position (463, 13).
; PLAN: r0=278(x), r1=135(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=13(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 135
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 13
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
