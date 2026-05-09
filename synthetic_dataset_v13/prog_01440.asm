; DESCRIPTION: Creates a blue circular shape at (306, 178) with radius 32.
; PLAN: r0=306(x), r1=178(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 178
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
