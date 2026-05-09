; DESCRIPTION: Creates a blue circular shape at (305, 92) with radius 30.
; PLAN: r0=305(x), r1=92(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 92
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
