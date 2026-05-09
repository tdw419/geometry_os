; DESCRIPTION: Draws a green circle centered at (407, 153) with radius 42.
; PLAN: r0=407(x), r1=153(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 153
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
