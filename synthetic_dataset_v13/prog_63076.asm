; DESCRIPTION: Draws a yellow circle centered at (337, 102) with radius 50.
; PLAN: r0=337(x), r1=102(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 102
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
