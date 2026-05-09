; DESCRIPTION: Creates a black circular shape at (424, 212) with radius 32.
; PLAN: r0=424(x), r1=212(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 212
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
