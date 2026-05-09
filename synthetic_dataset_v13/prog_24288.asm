; DESCRIPTION: Places a magenta circle of radius 22 at center (400, 188).
; PLAN: r0=400(x), r1=188(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 188
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
