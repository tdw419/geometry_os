; DESCRIPTION: Composite: Creates a green circular shape at (214, 168) with radius 11 then Places a magenta dot at position (422, 53).
; PLAN: r0=214(x), r1=168(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=53(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 214
LDI r1, 168
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 53
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
