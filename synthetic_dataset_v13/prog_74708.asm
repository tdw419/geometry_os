; DESCRIPTION: Composite: Creates a yellow circular shape at (253, 157) with radius 24 then Places a white dot at position (387, 175).
; PLAN: r0=253(x), r1=157(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=175(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 157
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 175
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
