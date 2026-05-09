; DESCRIPTION: Draws a white circle centered at (202, 189) with radius 66.
; PLAN: r0=202(x), r1=189(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 189
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
