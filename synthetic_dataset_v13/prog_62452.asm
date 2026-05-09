; DESCRIPTION: Draws a magenta circle centered at (288, 82) with radius 72.
; PLAN: r0=288(x), r1=82(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 82
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
