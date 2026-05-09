; DESCRIPTION: Places a blue circle of radius 43 at center (221, 182).
; PLAN: r0=221(x), r1=182(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 182
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
