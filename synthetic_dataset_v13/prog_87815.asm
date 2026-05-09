; DESCRIPTION: Creates a magenta circular shape at (197, 132) with radius 60.
; PLAN: r0=197(x), r1=132(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 132
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
