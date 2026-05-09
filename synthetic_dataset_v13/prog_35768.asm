; DESCRIPTION: Creates a red circular shape at (402, 112) with radius 79.
; PLAN: r0=402(x), r1=112(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 112
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
