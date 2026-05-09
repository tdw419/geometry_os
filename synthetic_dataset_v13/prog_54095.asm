; DESCRIPTION: Draws a white circle centered at (281, 178) with radius 31.
; PLAN: r0=281(x), r1=178(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 178
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
