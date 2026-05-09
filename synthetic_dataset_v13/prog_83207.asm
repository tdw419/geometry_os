; DESCRIPTION: Composite: Creates a red circular shape at (464, 201) with radius 45 then Places a yellow dot at position (305, 179).
; PLAN: r0=464(x), r1=201(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=179(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 464
LDI r1, 201
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 179
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
