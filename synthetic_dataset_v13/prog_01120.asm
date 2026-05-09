; DESCRIPTION: Creates a red circular shape at (20, 142) with radius 14.
; PLAN: r0=20(x), r1=142(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 142
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
