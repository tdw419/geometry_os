; DESCRIPTION: Creates a magenta circular shape at (59, 157) with radius 25.
; PLAN: r0=59(x), r1=157(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 157
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
