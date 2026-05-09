; DESCRIPTION: Places a magenta circle of radius 33 at center (409, 177).
; PLAN: r0=409(x), r1=177(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 177
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
