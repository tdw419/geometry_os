; DESCRIPTION: Creates a yellow circular shape at (182, 194) with radius 36.
; PLAN: r0=182(x), r1=194(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 194
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
