; DESCRIPTION: Creates a red circular shape at (112, 134) with radius 58.
; PLAN: r0=112(x), r1=134(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 134
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
