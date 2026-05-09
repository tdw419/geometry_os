; DESCRIPTION: Composite: Creates a orange circular shape at (393, 126) with radius 79 then Places a purple dot at position (8, 1).
; PLAN: r0=393(x), r1=126(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=1(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 126
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 1
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
