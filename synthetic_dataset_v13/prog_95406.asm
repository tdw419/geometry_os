; DESCRIPTION: Draws a yellow circle centered at (332, 177) with radius 59.
; PLAN: r0=332(x), r1=177(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 177
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
