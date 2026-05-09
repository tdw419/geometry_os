; DESCRIPTION: Creates a orange circular shape at (412, 38) with radius 29.
; PLAN: r0=412(x), r1=38(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 38
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
