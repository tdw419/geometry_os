; DESCRIPTION: Composite: Creates a blue circular shape at (252, 180) with radius 69 then Places a black dot at position (293, 45).
; PLAN: r0=252(x), r1=180(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=45(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 252
LDI r1, 180
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 45
LDI r7, 0x000000
PSET r5, r6, r7
HALT
