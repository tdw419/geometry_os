; DESCRIPTION: Creates a orange circular shape at (403, 153) with radius 74.
; PLAN: r0=403(x), r1=153(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 153
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
