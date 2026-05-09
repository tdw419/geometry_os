; DESCRIPTION: Creates a magenta circular shape at (374, 117) with radius 74.
; PLAN: r0=374(x), r1=117(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 117
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
