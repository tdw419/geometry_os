; DESCRIPTION: Places a magenta circle of radius 39 at center (374, 188).
; PLAN: r0=374(x), r1=188(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 188
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
