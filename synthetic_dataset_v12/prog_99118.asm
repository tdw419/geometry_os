; DESCRIPTION: Draws a white circle centered at (402, 179) with radius 54.
; PLAN: r0=402(x), r1=179(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 179
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
