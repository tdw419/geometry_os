; DESCRIPTION: Creates a red circular shape at (177, 79) with radius 53.
; PLAN: r0=177(x), r1=79(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 79
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
