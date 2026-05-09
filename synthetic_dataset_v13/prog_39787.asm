; DESCRIPTION: Creates a white circular shape at (115, 95) with radius 65.
; PLAN: r0=115(x), r1=95(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 95
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
