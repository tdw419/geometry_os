; DESCRIPTION: Composite: Renders a black disk with center (397, 190) and radius 33 then Places a orange dot at position (188, 115).
; PLAN: r0=397(x), r1=190(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=115(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 190
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 115
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
