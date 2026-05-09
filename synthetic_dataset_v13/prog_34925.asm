; DESCRIPTION: Draws a yellow circle centered at (118, 177) with radius 72.
; PLAN: r0=118(x), r1=177(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 177
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
