; DESCRIPTION: Draws a white circle centered at (345, 165) with radius 64.
; PLAN: r0=345(x), r1=165(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 165
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
