; DESCRIPTION: Creates a white circular shape at (402, 82) with radius 70.
; PLAN: r0=402(x), r1=82(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 82
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
