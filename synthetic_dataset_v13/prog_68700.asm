; DESCRIPTION: Creates a black circular shape at (90, 95) with radius 67.
; PLAN: r0=90(x), r1=95(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 95
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
