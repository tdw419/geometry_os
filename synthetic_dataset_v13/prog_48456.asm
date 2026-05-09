; DESCRIPTION: Creates a red circular shape at (363, 138) with radius 68.
; PLAN: r0=363(x), r1=138(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 138
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
