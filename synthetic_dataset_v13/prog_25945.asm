; DESCRIPTION: Draws a magenta circle centered at (460, 82) with radius 45.
; PLAN: r0=460(x), r1=82(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 82
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
