; DESCRIPTION: Creates a white circular shape at (279, 151) with radius 79.
; PLAN: r0=279(x), r1=151(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 151
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
