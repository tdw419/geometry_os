; DESCRIPTION: Places a magenta circle of radius 62 at center (245, 112).
; PLAN: r0=245(x), r1=112(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 112
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
