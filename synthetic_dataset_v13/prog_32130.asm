; DESCRIPTION: Creates a magenta circular shape at (484, 200) with radius 16.
; PLAN: r0=484(x), r1=200(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 484
LDI r1, 200
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
