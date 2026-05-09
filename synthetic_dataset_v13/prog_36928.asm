; DESCRIPTION: Creates a black circular shape at (443, 131) with radius 28.
; PLAN: r0=443(x), r1=131(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 131
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
