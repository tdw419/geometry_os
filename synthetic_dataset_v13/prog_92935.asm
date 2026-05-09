; DESCRIPTION: Creates a black circular shape at (215, 207) with radius 24.
; PLAN: r0=215(x), r1=207(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 207
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
