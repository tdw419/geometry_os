; DESCRIPTION: Creates a purple circular shape at (156, 93) with radius 40.
; PLAN: r0=156(x), r1=93(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 93
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
