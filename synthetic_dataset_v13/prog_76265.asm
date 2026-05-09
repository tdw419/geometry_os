; DESCRIPTION: Creates a red circular shape at (482, 132) with radius 30.
; PLAN: r0=482(x), r1=132(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 132
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
