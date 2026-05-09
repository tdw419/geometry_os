; DESCRIPTION: Composite: Draws a purple circle centered at (198, 83) with radius 64 then Sets a single white pixel at (368, 94).
; PLAN: r0=198(x), r1=83(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=94(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 83
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 94
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
