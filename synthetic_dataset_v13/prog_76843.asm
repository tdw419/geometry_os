; DESCRIPTION: Creates a white circular shape at (74, 27) with radius 26.
; PLAN: r0=74(x), r1=27(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 27
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
