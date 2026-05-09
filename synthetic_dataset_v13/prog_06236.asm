; DESCRIPTION: Creates a white circular shape at (439, 146) with radius 56.
; PLAN: r0=439(x), r1=146(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 146
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
