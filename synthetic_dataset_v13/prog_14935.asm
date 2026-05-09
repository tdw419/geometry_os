; DESCRIPTION: Draws a yellow circle centered at (100, 139) with radius 42.
; PLAN: r0=100(x), r1=139(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 139
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
