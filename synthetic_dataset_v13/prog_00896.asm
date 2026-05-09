; DESCRIPTION: Composite: Creates a white circular shape at (151, 155) with radius 72 then Places a white dot at position (437, 253).
; PLAN: r0=151(x), r1=155(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=253(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 155
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 253
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
