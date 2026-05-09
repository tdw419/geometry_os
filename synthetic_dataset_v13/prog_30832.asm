; DESCRIPTION: Draws a magenta circle centered at (417, 59) with radius 31.
; PLAN: r0=417(x), r1=59(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 59
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
