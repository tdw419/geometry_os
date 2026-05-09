; DESCRIPTION: Draws a white circle centered at (243, 100) with radius 13.
; PLAN: r0=243(x), r1=100(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 100
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
