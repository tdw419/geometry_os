; DESCRIPTION: Creates a white circular shape at (151, 106) with radius 57.
; PLAN: r0=151(x), r1=106(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 106
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
