; DESCRIPTION: Places a magenta circle of radius 18 at center (222, 126).
; PLAN: r0=222(x), r1=126(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 126
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
