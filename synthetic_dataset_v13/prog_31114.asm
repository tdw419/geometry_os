; DESCRIPTION: Draws a white circle centered at (313, 145) with radius 13.
; PLAN: r0=313(x), r1=145(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 145
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
