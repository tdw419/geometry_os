; DESCRIPTION: Creates a green circular shape at (178, 164) with radius 72.
; PLAN: r0=178(x), r1=164(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 164
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
