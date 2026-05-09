; DESCRIPTION: Draws a magenta circle centered at (395, 189) with radius 59.
; PLAN: r0=395(x), r1=189(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 189
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
