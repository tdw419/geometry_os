; DESCRIPTION: Creates a white circular shape at (300, 72) with radius 28.
; PLAN: r0=300(x), r1=72(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 72
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
