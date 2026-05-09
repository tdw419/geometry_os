; DESCRIPTION: Composite: Creates a orange circular shape at (336, 63) with radius 32 then Places a orange dot at position (485, 25).
; PLAN: r0=336(x), r1=63(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x), r6=25(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 63
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 25
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
