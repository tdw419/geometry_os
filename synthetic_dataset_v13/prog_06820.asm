; DESCRIPTION: Composite: Creates a magenta circular shape at (183, 103) with radius 75 then Sets a single white pixel at (482, 125).
; PLAN: r0=183(x), r1=103(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x), r6=125(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 103
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 125
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
