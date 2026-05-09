; DESCRIPTION: Creates a blue circular shape at (102, 58) with radius 13.
; PLAN: r0=102(x), r1=58(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 58
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
