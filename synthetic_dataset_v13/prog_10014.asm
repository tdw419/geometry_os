; DESCRIPTION: Creates a green circular shape at (215, 92) with radius 53.
; PLAN: r0=215(x), r1=92(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 92
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
