; DESCRIPTION: Creates a magenta circular shape at (236, 121) with radius 80.
; PLAN: r0=236(x), r1=121(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 121
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
