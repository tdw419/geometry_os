; DESCRIPTION: Draws a magenta circle centered at (290, 172) with radius 46.
; PLAN: r0=290(x), r1=172(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 172
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
