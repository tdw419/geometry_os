; DESCRIPTION: Composite: Draws a purple circle centered at (149, 96) with radius 33 then Places a orange dot at position (423, 13).
; PLAN: r0=149(x), r1=96(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=13(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 96
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 13
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
