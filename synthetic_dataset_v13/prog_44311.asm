; DESCRIPTION: Creates a green circular shape at (361, 178) with radius 61.
; PLAN: r0=361(x), r1=178(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 178
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
