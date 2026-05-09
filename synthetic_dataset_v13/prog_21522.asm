; DESCRIPTION: Creates a red circular shape at (203, 196) with radius 56.
; PLAN: r0=203(x), r1=196(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 196
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
