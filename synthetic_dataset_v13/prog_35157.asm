; DESCRIPTION: Composite: Renders a cyan disk with center (285, 157) and radius 39 then Sets a single orange pixel at (33, 233).
; PLAN: r0=285(x), r1=157(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=233(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 157
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 233
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
