; DESCRIPTION: Creates a blue circular shape at (482, 28) with radius 15.
; PLAN: r0=482(x), r1=28(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 28
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
