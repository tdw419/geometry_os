; DESCRIPTION: Creates a yellow circular shape at (102, 71) with radius 48.
; PLAN: r0=102(x), r1=71(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 71
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
