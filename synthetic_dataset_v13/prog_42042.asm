; DESCRIPTION: Draws a white circle centered at (131, 63) with radius 58.
; PLAN: r0=131(x), r1=63(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 63
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
