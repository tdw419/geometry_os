; DESCRIPTION: Renders a magenta disk with center (31, 93) and radius 14.
; PLAN: r0=31(x), r1=93(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 93
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
