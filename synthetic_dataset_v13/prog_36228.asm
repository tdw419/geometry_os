; DESCRIPTION: Creates a red circular shape at (134, 120) with radius 40.
; PLAN: r0=134(x), r1=120(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 120
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
