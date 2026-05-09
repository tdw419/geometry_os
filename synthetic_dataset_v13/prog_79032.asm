; DESCRIPTION: Creates a red circular shape at (466, 155) with radius 16.
; PLAN: r0=466(x), r1=155(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 155
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
