; DESCRIPTION: Places a magenta circle of radius 72 at center (171, 142).
; PLAN: r0=171(x), r1=142(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 142
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
