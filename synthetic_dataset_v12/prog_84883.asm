; DESCRIPTION: Creates a orange circular shape at (121, 73) with radius 19.
; PLAN: r0=121(x), r1=73(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 73
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
