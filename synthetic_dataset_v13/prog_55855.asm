; DESCRIPTION: Draws a magenta circle centered at (117, 171) with radius 57.
; PLAN: r0=117(x), r1=171(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 171
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
