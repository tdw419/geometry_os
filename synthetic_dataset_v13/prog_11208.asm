; DESCRIPTION: Creates a red circular shape at (203, 89) with radius 69.
; PLAN: r0=203(x), r1=89(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 89
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
