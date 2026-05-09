; DESCRIPTION: Creates a white circular shape at (465, 113) with radius 19.
; PLAN: r0=465(x), r1=113(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 113
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
