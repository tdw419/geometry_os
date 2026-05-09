; DESCRIPTION: Composite: Creates a magenta circular shape at (234, 63) with radius 61 then Places a orange dot at position (109, 221).
; PLAN: r0=234(x), r1=63(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=221(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 63
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 221
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
