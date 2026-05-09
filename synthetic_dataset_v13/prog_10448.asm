; DESCRIPTION: Draws a yellow circle centered at (324, 36) with radius 36.
; PLAN: r0=324(x), r1=36(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 36
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
