; DESCRIPTION: Composite: Renders a magenta disk with center (31, 168) and radius 16 then Sets a single white pixel at (316, 18).
; PLAN: r0=31(x), r1=168(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=18(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 31
LDI r1, 168
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 18
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
