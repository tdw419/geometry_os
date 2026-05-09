; DESCRIPTION: Draws a white circle centered at (440, 97) with radius 48.
; PLAN: r0=440(x), r1=97(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 97
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
