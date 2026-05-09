; DESCRIPTION: Creates a white circular shape at (146, 203) with radius 34.
; PLAN: r0=146(x), r1=203(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 203
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
