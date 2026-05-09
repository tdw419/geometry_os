; DESCRIPTION: Creates a blue circular shape at (328, 98) with radius 36.
; PLAN: r0=328(x), r1=98(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 98
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
