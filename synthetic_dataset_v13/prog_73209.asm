; DESCRIPTION: Places a magenta circle of radius 36 at center (304, 172).
; PLAN: r0=304(x), r1=172(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 172
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
