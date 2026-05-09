; DESCRIPTION: Draws a magenta circle centered at (404, 213) with radius 13.
; PLAN: r0=404(x), r1=213(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 213
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
