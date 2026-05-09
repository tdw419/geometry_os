; DESCRIPTION: Creates a blue circular shape at (370, 27) with radius 26.
; PLAN: r0=370(x), r1=27(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 27
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
