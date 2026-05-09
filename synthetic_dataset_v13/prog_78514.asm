; DESCRIPTION: Creates a blue circular shape at (358, 120) with radius 68.
; PLAN: r0=358(x), r1=120(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 120
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
