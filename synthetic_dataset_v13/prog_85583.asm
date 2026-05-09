; DESCRIPTION: Places a blue circle of radius 68 at center (141, 181).
; PLAN: r0=141(x), r1=181(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 181
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
