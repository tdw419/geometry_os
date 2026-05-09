; DESCRIPTION: Creates a white circular shape at (74, 114) with radius 70.
; PLAN: r0=74(x), r1=114(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 114
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
