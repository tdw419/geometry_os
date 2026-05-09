; DESCRIPTION: Places a magenta circle of radius 36 at center (469, 92).
; PLAN: r0=469(x), r1=92(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 92
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
