; DESCRIPTION: Composite: Creates a orange circular shape at (93, 118) with radius 61 then Sets a single white pixel at (182, 113).
; PLAN: r0=93(x), r1=118(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=113(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 118
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 113
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
