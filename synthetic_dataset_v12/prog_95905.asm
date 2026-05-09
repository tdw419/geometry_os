; DESCRIPTION: Creates a red circular shape at (367, 159) with radius 56.
; PLAN: r0=367(x), r1=159(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 159
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
