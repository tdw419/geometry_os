; DESCRIPTION: Creates a black circular shape at (213, 124) with radius 35.
; PLAN: r0=213(x), r1=124(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 124
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
