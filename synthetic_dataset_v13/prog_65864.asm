; DESCRIPTION: Creates a magenta circular shape at (110, 93) with radius 26.
; PLAN: r0=110(x), r1=93(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 93
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
