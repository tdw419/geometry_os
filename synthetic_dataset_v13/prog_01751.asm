; DESCRIPTION: Composite: Creates a black circular shape at (453, 154) with radius 36 then Places a red dot at position (61, 65).
; PLAN: r0=453(x), r1=154(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x), r6=65(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 154
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 65
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
