; DESCRIPTION: Creates a white circular shape at (140, 114) with radius 43.
; PLAN: r0=140(x), r1=114(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 114
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
