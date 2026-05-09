; DESCRIPTION: Creates a yellow circular shape at (102, 146) with radius 11.
; PLAN: r0=102(x), r1=146(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 146
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
