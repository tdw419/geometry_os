; DESCRIPTION: Places a magenta circle of radius 13 at center (271, 39).
; PLAN: r0=271(x), r1=39(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 39
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
