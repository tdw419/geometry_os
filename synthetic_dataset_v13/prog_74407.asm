; DESCRIPTION: Draws a magenta circle centered at (404, 161) with radius 64.
; PLAN: r0=404(x), r1=161(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 161
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
