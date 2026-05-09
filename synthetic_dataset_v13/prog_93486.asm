; DESCRIPTION: Creates a blue circular shape at (346, 185) with radius 40.
; PLAN: r0=346(x), r1=185(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 185
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
