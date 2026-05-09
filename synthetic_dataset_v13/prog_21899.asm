; DESCRIPTION: Places a blue circle of radius 71 at center (316, 155).
; PLAN: r0=316(x), r1=155(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 155
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
