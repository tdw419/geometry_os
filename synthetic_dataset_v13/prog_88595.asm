; DESCRIPTION: Creates a magenta circular shape at (307, 206) with radius 35.
; PLAN: r0=307(x), r1=206(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 206
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
