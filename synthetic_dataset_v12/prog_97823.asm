; DESCRIPTION: Places a magenta circle of radius 73 at center (213, 108).
; PLAN: r0=213(x), r1=108(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 108
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
