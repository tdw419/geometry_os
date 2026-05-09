; DESCRIPTION: Creates a black circular shape at (59, 203) with radius 27.
; PLAN: r0=59(x), r1=203(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 203
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
