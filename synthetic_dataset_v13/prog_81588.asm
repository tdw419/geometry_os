; DESCRIPTION: Composite: Creates a orange circular shape at (463, 33) with radius 14 then Places a white dot at position (371, 58).
; PLAN: r0=463(x), r1=33(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=58(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 463
LDI r1, 33
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 58
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
