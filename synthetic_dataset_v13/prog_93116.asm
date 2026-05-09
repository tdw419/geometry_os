; DESCRIPTION: Creates a black circular shape at (309, 164) with radius 72.
; PLAN: r0=309(x), r1=164(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 164
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
