; DESCRIPTION: Draws a magenta circle centered at (404, 78) with radius 47.
; PLAN: r0=404(x), r1=78(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 78
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
