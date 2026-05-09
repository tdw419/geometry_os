; DESCRIPTION: Composite: Places a green dot at position (339, 217) then Creates a yellow circular shape at (71, 83) with radius 53.
; PLAN: r0=339(x), r1=217(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=71(x), r6=83(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 217
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 71
LDI r6, 83
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
