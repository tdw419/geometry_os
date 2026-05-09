; DESCRIPTION: Creates a red circular shape at (159, 111) with radius 10.
; PLAN: r0=159(x), r1=111(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 111
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
