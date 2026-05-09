; DESCRIPTION: Composite: Places a red circle of radius 36 at center (250, 184) then Places a black dot at position (463, 203).
; PLAN: r0=250(x), r1=184(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=203(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 184
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 203
LDI r7, 0x000000
PSET r5, r6, r7
HALT
