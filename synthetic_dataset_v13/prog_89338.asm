; DESCRIPTION: Places a yellow circle of radius 53 at center (72, 173).
; PLAN: r0=72(x), r1=173(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 173
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
