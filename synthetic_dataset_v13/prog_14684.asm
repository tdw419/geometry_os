; DESCRIPTION: Creates a red circular shape at (442, 100) with radius 55.
; PLAN: r0=442(x), r1=100(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 100
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
