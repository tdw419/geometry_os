; DESCRIPTION: Places a purple circle of radius 62 at center (284, 181).
; PLAN: r0=284(x), r1=181(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 181
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
