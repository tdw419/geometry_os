; DESCRIPTION: Composite: Sets a single white pixel at (324, 212) then Places a purple 107x53 rectangle at position (32, 156) then Creates a yellow circular shape at (83, 95) with radius 19.
; PLAN: r0=324(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=156(y), r7=107(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x), r11=95(y), r12=19(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 32
LDI r6, 156
LDI r7, 107
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 95
LDI r12, 19
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
