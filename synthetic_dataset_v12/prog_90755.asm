; DESCRIPTION: Draws a white circle centered at (449, 166) with radius 32.
; PLAN: r0=449(x), r1=166(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 166
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
