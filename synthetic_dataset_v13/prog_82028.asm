; DESCRIPTION: Creates a blue circular shape at (398, 122) with radius 39.
; PLAN: r0=398(x), r1=122(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 122
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
