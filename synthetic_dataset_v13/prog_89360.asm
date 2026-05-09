; DESCRIPTION: Draws a white circle centered at (395, 153) with radius 48.
; PLAN: r0=395(x), r1=153(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 153
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
