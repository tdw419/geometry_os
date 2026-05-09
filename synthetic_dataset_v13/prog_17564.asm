; DESCRIPTION: Places a blue circle of radius 58 at center (167, 90).
; PLAN: r0=167(x), r1=90(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 90
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
