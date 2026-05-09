; DESCRIPTION: Creates a black circular shape at (189, 154) with radius 50.
; PLAN: r0=189(x), r1=154(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 154
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
