; DESCRIPTION: Places a magenta circle of radius 59 at center (291, 150).
; PLAN: r0=291(x), r1=150(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 150
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
