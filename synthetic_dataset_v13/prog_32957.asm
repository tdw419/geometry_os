; DESCRIPTION: Places a magenta circle of radius 20 at center (230, 46).
; PLAN: r0=230(x), r1=46(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 46
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
