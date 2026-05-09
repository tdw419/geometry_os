; DESCRIPTION: Creates a red circular shape at (114, 176) with radius 50.
; PLAN: r0=114(x), r1=176(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 176
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
