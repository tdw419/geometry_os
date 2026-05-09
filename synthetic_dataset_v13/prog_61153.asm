; DESCRIPTION: Creates a red circular shape at (407, 185) with radius 29.
; PLAN: r0=407(x), r1=185(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 185
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
