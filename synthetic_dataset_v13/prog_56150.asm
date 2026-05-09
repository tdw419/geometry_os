; DESCRIPTION: Creates a red circular shape at (250, 177) with radius 71.
; PLAN: r0=250(x), r1=177(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 177
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
