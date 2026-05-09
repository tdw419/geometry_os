; DESCRIPTION: Draws a green circle centered at (108, 116) with radius 66.
; PLAN: r0=108(x), r1=116(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 116
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
