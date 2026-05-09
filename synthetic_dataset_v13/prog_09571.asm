; DESCRIPTION: Places a magenta circle of radius 44 at center (126, 135).
; PLAN: r0=126(x), r1=135(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 135
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
