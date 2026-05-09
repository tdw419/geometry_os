; DESCRIPTION: Draws a green circle centered at (174, 67) with radius 55.
; PLAN: r0=174(x), r1=67(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 67
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
