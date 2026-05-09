; DESCRIPTION: Creates a red circular shape at (186, 123) with radius 69.
; PLAN: r0=186(x), r1=123(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 123
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
