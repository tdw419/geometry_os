; DESCRIPTION: Draws a white circle centered at (190, 153) with radius 19.
; PLAN: r0=190(x), r1=153(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 153
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
