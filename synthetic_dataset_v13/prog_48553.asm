; DESCRIPTION: Composite: Draws a white circle centered at (286, 103) with radius 69 then Sets a single purple pixel at (116, 232).
; PLAN: r0=286(x), r1=103(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=232(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 103
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 232
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
