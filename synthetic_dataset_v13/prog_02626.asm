; DESCRIPTION: Draws a magenta circle centered at (434, 134) with radius 24.
; PLAN: r0=434(x), r1=134(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 134
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
