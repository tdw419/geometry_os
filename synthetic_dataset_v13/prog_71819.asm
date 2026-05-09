; DESCRIPTION: Draws a magenta circle centered at (430, 59) with radius 40.
; PLAN: r0=430(x), r1=59(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 59
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
