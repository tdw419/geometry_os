; DESCRIPTION: Places a yellow circle of radius 21 at center (130, 133).
; PLAN: r0=130(x), r1=133(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 133
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
