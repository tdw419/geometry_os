; DESCRIPTION: Creates a blue circular shape at (353, 182) with radius 60.
; PLAN: r0=353(x), r1=182(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 182
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
