; DESCRIPTION: Draws a magenta circle centered at (290, 171) with radius 35.
; PLAN: r0=290(x), r1=171(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 171
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
