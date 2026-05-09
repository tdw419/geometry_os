; DESCRIPTION: Creates a orange circular shape at (414, 74) with radius 72.
; PLAN: r0=414(x), r1=74(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 74
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
