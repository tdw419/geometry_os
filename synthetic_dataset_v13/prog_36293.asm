; DESCRIPTION: Creates a black circular shape at (294, 95) with radius 60.
; PLAN: r0=294(x), r1=95(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 95
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
