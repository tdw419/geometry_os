; DESCRIPTION: Creates a orange circular shape at (263, 38) with radius 14.
; PLAN: r0=263(x), r1=38(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 38
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
