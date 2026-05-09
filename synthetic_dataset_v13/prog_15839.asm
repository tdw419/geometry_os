; DESCRIPTION: Composite: Creates a red circular shape at (123, 115) with radius 79 then Places a orange dot at position (402, 65).
; PLAN: r0=123(x), r1=115(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=65(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 115
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 65
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
