; DESCRIPTION: Draws a magenta circle centered at (152, 198) with radius 56.
; PLAN: r0=152(x), r1=198(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 198
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
