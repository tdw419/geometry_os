; DESCRIPTION: Creates a red circular shape at (152, 156) with radius 61.
; PLAN: r0=152(x), r1=156(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 156
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
