; DESCRIPTION: Creates a blue circular shape at (378, 95) with radius 59.
; PLAN: r0=378(x), r1=95(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 95
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
