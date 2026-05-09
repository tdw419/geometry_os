; DESCRIPTION: Creates a blue circular shape at (391, 80) with radius 66.
; PLAN: r0=391(x), r1=80(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 80
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
