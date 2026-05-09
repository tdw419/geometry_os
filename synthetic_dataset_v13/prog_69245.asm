; DESCRIPTION: Creates a red circular shape at (179, 76) with radius 54.
; PLAN: r0=179(x), r1=76(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 76
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
