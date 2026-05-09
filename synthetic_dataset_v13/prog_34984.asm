; DESCRIPTION: Creates a red circular shape at (129, 156) with radius 48.
; PLAN: r0=129(x), r1=156(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 156
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
