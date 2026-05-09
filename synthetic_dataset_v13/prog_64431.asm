; DESCRIPTION: Creates a red circular shape at (234, 182) with radius 42.
; PLAN: r0=234(x), r1=182(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 182
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
