; DESCRIPTION: Creates a yellow circular shape at (74, 71) with radius 45.
; PLAN: r0=74(x), r1=71(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 71
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
