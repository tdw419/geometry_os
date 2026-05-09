; DESCRIPTION: Places a magenta circle of radius 13 at center (28, 126).
; PLAN: r0=28(x), r1=126(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 126
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
