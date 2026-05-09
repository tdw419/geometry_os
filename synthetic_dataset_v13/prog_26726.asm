; DESCRIPTION: Composite: Draws a purple circle centered at (384, 186) with radius 42 then Sets a single white pixel at (248, 238).
; PLAN: r0=384(x), r1=186(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=238(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 186
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 238
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
