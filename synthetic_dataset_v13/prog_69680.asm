; DESCRIPTION: Creates a yellow circular shape at (74, 184) with radius 50.
; PLAN: r0=74(x), r1=184(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 184
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
