; DESCRIPTION: Places a magenta circle of radius 32 at center (213, 135).
; PLAN: r0=213(x), r1=135(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 135
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
