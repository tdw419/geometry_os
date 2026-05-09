; DESCRIPTION: Creates a green circular shape at (213, 72) with radius 56.
; PLAN: r0=213(x), r1=72(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 72
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
