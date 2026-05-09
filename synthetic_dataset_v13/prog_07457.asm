; DESCRIPTION: Creates a white circular shape at (456, 143) with radius 48.
; PLAN: r0=456(x), r1=143(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 143
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
