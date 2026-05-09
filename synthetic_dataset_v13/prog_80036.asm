; DESCRIPTION: Draws a magenta circle centered at (423, 168) with radius 72.
; PLAN: r0=423(x), r1=168(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 168
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
