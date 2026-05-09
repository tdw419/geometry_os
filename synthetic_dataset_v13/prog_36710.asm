; DESCRIPTION: Composite: Creates a blue circular shape at (256, 102) with radius 41 then Places a orange dot at position (237, 47).
; PLAN: r0=256(x), r1=102(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=47(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 256
LDI r1, 102
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 47
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
