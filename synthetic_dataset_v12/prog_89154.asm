; DESCRIPTION: Draws a yellow circle centered at (92, 134) with radius 28.
; PLAN: r0=92(x), r1=134(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 134
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
