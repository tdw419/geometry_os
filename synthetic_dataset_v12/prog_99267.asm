; DESCRIPTION: Draws a yellow circle centered at (222, 79) with radius 67.
; PLAN: r0=222(x), r1=79(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 79
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
