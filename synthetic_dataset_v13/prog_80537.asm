; DESCRIPTION: Creates a red circular shape at (214, 176) with radius 18.
; PLAN: r0=214(x), r1=176(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 176
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
