; DESCRIPTION: Places a purple circle of radius 38 at center (245, 133).
; PLAN: r0=245(x), r1=133(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 133
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
