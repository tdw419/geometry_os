; DESCRIPTION: Draws a magenta circle centered at (404, 150) with radius 43.
; PLAN: r0=404(x), r1=150(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 150
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
