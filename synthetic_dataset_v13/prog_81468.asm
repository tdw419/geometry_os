; DESCRIPTION: Creates a blue circular shape at (170, 202) with radius 29.
; PLAN: r0=170(x), r1=202(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 202
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
