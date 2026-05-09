; DESCRIPTION: Creates a red circular shape at (182, 117) with radius 79.
; PLAN: r0=182(x), r1=117(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 117
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
