; DESCRIPTION: Places a blue circle of radius 31 at center (102, 148).
; PLAN: r0=102(x), r1=148(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 148
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
