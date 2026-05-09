; DESCRIPTION: Draws a magenta circle centered at (174, 154) with radius 44.
; PLAN: r0=174(x), r1=154(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 154
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
