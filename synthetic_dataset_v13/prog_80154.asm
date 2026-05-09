; DESCRIPTION: Creates a yellow circular shape at (352, 101) with radius 43.
; PLAN: r0=352(x), r1=101(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 101
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
