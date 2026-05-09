; DESCRIPTION: Places a magenta circle of radius 33 at center (284, 61).
; PLAN: r0=284(x), r1=61(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 61
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
