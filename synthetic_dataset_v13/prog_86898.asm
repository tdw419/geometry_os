; DESCRIPTION: Draws a yellow circle centered at (255, 148) with radius 77.
; PLAN: r0=255(x), r1=148(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 148
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
