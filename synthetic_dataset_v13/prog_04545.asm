; DESCRIPTION: Draws a green circle centered at (329, 154) with radius 59.
; PLAN: r0=329(x), r1=154(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 154
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
