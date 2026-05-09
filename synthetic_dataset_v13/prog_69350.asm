; DESCRIPTION: Composite: Creates a white circular shape at (263, 184) with radius 66 then Places a white dot at position (387, 101).
; PLAN: r0=263(x), r1=184(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=101(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 184
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 101
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
