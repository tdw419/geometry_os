; DESCRIPTION: Creates a red circular shape at (40, 210) with radius 15.
; PLAN: r0=40(x), r1=210(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 210
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
