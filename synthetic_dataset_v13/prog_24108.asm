; DESCRIPTION: Draws a magenta circle centered at (74, 120) with radius 46.
; PLAN: r0=74(x), r1=120(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 120
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
