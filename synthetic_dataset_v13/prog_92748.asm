; DESCRIPTION: Draws a white circle centered at (345, 126) with radius 51.
; PLAN: r0=345(x), r1=126(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 126
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
