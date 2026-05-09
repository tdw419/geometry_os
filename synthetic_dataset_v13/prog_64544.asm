; DESCRIPTION: Draws a yellow circle centered at (274, 50) with radius 28.
; PLAN: r0=274(x), r1=50(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 50
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
