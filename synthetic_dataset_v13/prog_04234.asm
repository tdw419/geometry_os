; DESCRIPTION: Creates a black circular shape at (153, 143) with radius 65.
; PLAN: r0=153(x), r1=143(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 143
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
