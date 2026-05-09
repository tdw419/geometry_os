; DESCRIPTION: Composite: Sets a single black pixel at (213, 224) then Places a purple circle of radius 37 at center (76, 116).
; PLAN: r0=213(x), r1=224(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=116(y), r7=37(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 224
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 76
LDI r6, 116
LDI r7, 37
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
