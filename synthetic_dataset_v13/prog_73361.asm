; DESCRIPTION: Creates a magenta circular shape at (236, 40) with radius 38.
; PLAN: r0=236(x), r1=40(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 40
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
