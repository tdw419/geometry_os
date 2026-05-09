; DESCRIPTION: Creates a white circular shape at (325, 213) with radius 13.
; PLAN: r0=325(x), r1=213(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 213
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
