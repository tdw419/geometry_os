; DESCRIPTION: Draws a magenta circle centered at (337, 150) with radius 24.
; PLAN: r0=337(x), r1=150(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 150
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
