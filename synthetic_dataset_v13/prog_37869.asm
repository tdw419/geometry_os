; DESCRIPTION: Composite: Places a white circle of radius 10 at center (143, 223) then Places a black dot at position (57, 124).
; PLAN: r0=143(x), r1=223(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=124(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 223
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 124
LDI r7, 0x000000
PSET r5, r6, r7
HALT
