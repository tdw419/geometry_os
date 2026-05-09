; DESCRIPTION: Composite: Creates a red circular shape at (116, 83) with radius 65 then Places a blue dot at position (279, 90).
; PLAN: r0=116(x), r1=83(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=90(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 83
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 90
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
