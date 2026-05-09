; DESCRIPTION: Places a magenta circle of radius 16 at center (60, 26).
; PLAN: r0=60(x), r1=26(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 26
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
