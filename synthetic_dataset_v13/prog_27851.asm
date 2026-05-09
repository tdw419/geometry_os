; DESCRIPTION: Creates a magenta circular shape at (110, 149) with radius 73.
; PLAN: r0=110(x), r1=149(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 149
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
