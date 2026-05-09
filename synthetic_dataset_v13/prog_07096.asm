; DESCRIPTION: Composite: Places a black circle of radius 66 at center (88, 148) then Places a white dot at position (508, 16).
; PLAN: r0=88(x), r1=148(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=508(x), r6=16(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 88
LDI r1, 148
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 508
LDI r6, 16
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
