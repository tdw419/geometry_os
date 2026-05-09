; DESCRIPTION: Creates a red circular shape at (68, 55) with radius 38.
; PLAN: r0=68(x), r1=55(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 55
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
