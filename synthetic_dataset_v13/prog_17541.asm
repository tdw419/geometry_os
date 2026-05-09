; DESCRIPTION: Creates a red circular shape at (123, 67) with radius 32.
; PLAN: r0=123(x), r1=67(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 67
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
