; DESCRIPTION: Creates a purple circular shape at (102, 174) with radius 72.
; PLAN: r0=102(x), r1=174(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 174
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
