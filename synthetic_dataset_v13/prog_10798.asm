; DESCRIPTION: Composite: Creates a cyan circular shape at (459, 171) with radius 24 then Sets a single magenta pixel at (419, 253).
; PLAN: r0=459(x), r1=171(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=253(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 459
LDI r1, 171
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 253
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
