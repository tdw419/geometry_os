; DESCRIPTION: Places a magenta circle of radius 59 at center (79, 130).
; PLAN: r0=79(x), r1=130(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 130
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
