; DESCRIPTION: Places a magenta circle of radius 56 at center (127, 73).
; PLAN: r0=127(x), r1=73(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 73
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
