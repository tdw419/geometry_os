; DESCRIPTION: Places a magenta circle of radius 46 at center (167, 156).
; PLAN: r0=167(x), r1=156(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 156
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
