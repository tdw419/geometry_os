; DESCRIPTION: Composite: Creates a orange circular shape at (425, 194) with radius 12 then Places a black dot at position (377, 144).
; PLAN: r0=425(x), r1=194(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=144(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 194
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 144
LDI r7, 0x000000
PSET r5, r6, r7
HALT
