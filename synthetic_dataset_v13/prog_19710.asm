; DESCRIPTION: Creates a black circular shape at (139, 166) with radius 72.
; PLAN: r0=139(x), r1=166(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 166
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
