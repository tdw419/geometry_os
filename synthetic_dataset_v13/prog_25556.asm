; DESCRIPTION: Places a magenta circle of radius 46 at center (330, 80).
; PLAN: r0=330(x), r1=80(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 80
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
