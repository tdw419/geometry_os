; DESCRIPTION: Draws a white circle centered at (366, 195) with radius 59.
; PLAN: r0=366(x), r1=195(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 195
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
