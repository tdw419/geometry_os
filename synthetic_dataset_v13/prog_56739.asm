; DESCRIPTION: Creates a red circular shape at (474, 100) with radius 24.
; PLAN: r0=474(x), r1=100(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 100
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
