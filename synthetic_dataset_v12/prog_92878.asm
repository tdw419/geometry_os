; DESCRIPTION: Draws a magenta circle centered at (95, 111) with radius 58.
; PLAN: r0=95(x), r1=111(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 111
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
