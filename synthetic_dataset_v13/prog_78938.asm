; DESCRIPTION: Draws a yellow circle centered at (205, 139) with radius 32.
; PLAN: r0=205(x), r1=139(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 139
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
