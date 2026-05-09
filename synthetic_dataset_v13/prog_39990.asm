; DESCRIPTION: Draws a white circle centered at (333, 179) with radius 32.
; PLAN: r0=333(x), r1=179(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 179
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
