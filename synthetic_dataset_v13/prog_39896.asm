; DESCRIPTION: Creates a yellow circular shape at (316, 72) with radius 42.
; PLAN: r0=316(x), r1=72(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 72
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
