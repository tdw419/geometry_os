; DESCRIPTION: Creates a red circular shape at (81, 175) with radius 49.
; PLAN: r0=81(x), r1=175(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 175
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
