; DESCRIPTION: Composite: Draws a yellow circle centered at (339, 101) with radius 42 then Sets a single white pixel at (315, 15).
; PLAN: r0=339(x), r1=101(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=15(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 101
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 15
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
