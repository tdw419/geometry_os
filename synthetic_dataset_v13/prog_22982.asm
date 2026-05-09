; DESCRIPTION: Draws a white circle centered at (275, 22) with radius 22.
; PLAN: r0=275(x), r1=22(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 22
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
