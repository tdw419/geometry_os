; DESCRIPTION: Creates a white circular shape at (417, 166) with radius 79.
; PLAN: r0=417(x), r1=166(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 166
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
