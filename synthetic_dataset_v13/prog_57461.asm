; DESCRIPTION: Creates a red circular shape at (159, 79) with radius 64.
; PLAN: r0=159(x), r1=79(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 79
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
