; DESCRIPTION: Creates a red circular shape at (341, 180) with radius 66.
; PLAN: r0=341(x), r1=180(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 180
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
