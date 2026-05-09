; DESCRIPTION: Composite: Creates a purple circular shape at (266, 187) with radius 63 then Places a white dot at position (449, 69).
; PLAN: r0=266(x), r1=187(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x), r6=69(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 187
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 69
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
