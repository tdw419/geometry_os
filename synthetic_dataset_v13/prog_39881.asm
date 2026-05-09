; DESCRIPTION: Creates a orange circular shape at (403, 179) with radius 71.
; PLAN: r0=403(x), r1=179(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 179
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
