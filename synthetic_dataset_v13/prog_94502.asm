; DESCRIPTION: Draws a magenta circle centered at (303, 202) with radius 31.
; PLAN: r0=303(x), r1=202(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 202
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
