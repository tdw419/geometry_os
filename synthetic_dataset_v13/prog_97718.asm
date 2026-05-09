; DESCRIPTION: Creates a red circular shape at (134, 50) with radius 29.
; PLAN: r0=134(x), r1=50(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 50
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
