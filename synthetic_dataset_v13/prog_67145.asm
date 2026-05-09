; DESCRIPTION: Creates a green circular shape at (385, 122) with radius 61.
; PLAN: r0=385(x), r1=122(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 122
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
