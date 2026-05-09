; DESCRIPTION: Composite: Places a white circle of radius 56 at center (351, 103) then Places a magenta dot at position (48, 35).
; PLAN: r0=351(x), r1=103(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=35(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 103
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 35
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
