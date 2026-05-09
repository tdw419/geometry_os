; DESCRIPTION: Draws a black circle centered at (161, 92) with radius 68.
; PLAN: r0=161(x), r1=92(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 92
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
