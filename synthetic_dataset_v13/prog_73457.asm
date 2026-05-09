; DESCRIPTION: Creates a red circular shape at (409, 177) with radius 72.
; PLAN: r0=409(x), r1=177(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 177
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
