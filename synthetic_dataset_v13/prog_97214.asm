; DESCRIPTION: Composite: Places a cyan circle of radius 35 at center (76, 151) then Sets a single white pixel at (397, 107).
; PLAN: r0=76(x), r1=151(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=107(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 76
LDI r1, 151
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 107
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
