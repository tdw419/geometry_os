; DESCRIPTION: Composite: Creates a black circular shape at (364, 47) with radius 42 then Places a orange dot at position (509, 215).
; PLAN: r0=364(x), r1=47(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=509(x), r6=215(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 47
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 509
LDI r6, 215
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
