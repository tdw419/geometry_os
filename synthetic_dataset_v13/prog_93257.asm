; DESCRIPTION: Places a magenta circle of radius 25 at center (420, 126).
; PLAN: r0=420(x), r1=126(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 126
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
