; DESCRIPTION: Composite: Creates a blue circular shape at (360, 105) with radius 76 then Places a purple dot at position (209, 159).
; PLAN: r0=360(x), r1=105(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=159(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 360
LDI r1, 105
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 159
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
