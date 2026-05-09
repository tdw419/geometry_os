; DESCRIPTION: Places a magenta circle of radius 55 at center (252, 134).
; PLAN: r0=252(x), r1=134(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 134
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
