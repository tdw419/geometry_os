; DESCRIPTION: Composite: Creates a black circular shape at (130, 96) with radius 62 then Sets a single white pixel at (344, 243).
; PLAN: r0=130(x), r1=96(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=243(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 96
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 243
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
