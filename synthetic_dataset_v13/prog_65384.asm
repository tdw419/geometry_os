; DESCRIPTION: Composite: Creates a white circular shape at (411, 185) with radius 64 then Places a purple dot at position (19, 74).
; PLAN: r0=411(x), r1=185(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=74(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 185
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 74
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
