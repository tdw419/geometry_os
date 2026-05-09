; DESCRIPTION: Places a blue circle of radius 74 at center (181, 182).
; PLAN: r0=181(x), r1=182(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 182
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
