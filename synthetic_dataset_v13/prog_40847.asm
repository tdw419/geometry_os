; DESCRIPTION: Composite: Creates a black circular shape at (342, 142) with radius 66 then Places a orange dot at position (502, 196).
; PLAN: r0=342(x), r1=142(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=502(x), r6=196(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 142
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 502
LDI r6, 196
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
