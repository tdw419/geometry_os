; DESCRIPTION: Creates a blue circular shape at (309, 178) with radius 40.
; PLAN: r0=309(x), r1=178(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 178
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
