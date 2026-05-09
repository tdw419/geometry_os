; DESCRIPTION: Draws a white circle centered at (268, 128) with radius 16.
; PLAN: r0=268(x), r1=128(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 128
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
