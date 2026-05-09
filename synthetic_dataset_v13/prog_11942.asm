; DESCRIPTION: Creates a yellow circular shape at (69, 73) with radius 36.
; PLAN: r0=69(x), r1=73(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 73
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
