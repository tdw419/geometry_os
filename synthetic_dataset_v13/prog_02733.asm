; DESCRIPTION: Composite: Creates a green circular shape at (422, 196) with radius 55 then Sets a single magenta pixel at (433, 24).
; PLAN: r0=422(x), r1=196(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=24(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 196
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 24
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
