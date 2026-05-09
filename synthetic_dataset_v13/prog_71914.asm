; DESCRIPTION: Creates a red circular shape at (402, 164) with radius 20.
; PLAN: r0=402(x), r1=164(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 164
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
