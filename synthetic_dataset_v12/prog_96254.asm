; DESCRIPTION: Places a magenta circle of radius 49 at center (319, 128).
; PLAN: r0=319(x), r1=128(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 128
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
