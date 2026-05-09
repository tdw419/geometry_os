; DESCRIPTION: Creates a blue circular shape at (75, 173) with radius 73.
; PLAN: r0=75(x), r1=173(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 173
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
