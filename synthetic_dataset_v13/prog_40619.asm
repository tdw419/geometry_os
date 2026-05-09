; DESCRIPTION: Creates a red circular shape at (176, 19) with radius 11.
; PLAN: r0=176(x), r1=19(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 19
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
