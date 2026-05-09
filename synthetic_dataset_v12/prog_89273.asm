; DESCRIPTION: Places a magenta circle of radius 32 at center (368, 46).
; PLAN: r0=368(x), r1=46(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 46
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
