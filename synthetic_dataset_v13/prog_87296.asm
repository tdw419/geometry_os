; DESCRIPTION: Places a magenta circle of radius 43 at center (299, 198).
; PLAN: r0=299(x), r1=198(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 198
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
