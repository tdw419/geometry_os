; DESCRIPTION: Creates a red circular shape at (246, 165) with radius 56.
; PLAN: r0=246(x), r1=165(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 165
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
