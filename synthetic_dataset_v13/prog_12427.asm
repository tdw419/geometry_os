; DESCRIPTION: Composite: Creates a purple circular shape at (183, 193) with radius 42 then Sets a single white pixel at (291, 187).
; PLAN: r0=183(x), r1=193(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 193
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
