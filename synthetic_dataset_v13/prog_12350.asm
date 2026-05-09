; DESCRIPTION: Places a magenta circle of radius 56 at center (154, 112).
; PLAN: r0=154(x), r1=112(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 112
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
