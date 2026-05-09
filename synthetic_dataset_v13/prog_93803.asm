; DESCRIPTION: Creates a blue circular shape at (303, 92) with radius 12.
; PLAN: r0=303(x), r1=92(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 92
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
