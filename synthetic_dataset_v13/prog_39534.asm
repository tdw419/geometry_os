; DESCRIPTION: Draws a blue circle centered at (187, 72) with radius 59.
; PLAN: r0=187(x), r1=72(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 72
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
