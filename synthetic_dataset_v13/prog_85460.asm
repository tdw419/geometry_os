; DESCRIPTION: Places a yellow circle of radius 21 at center (34, 30).
; PLAN: r0=34(x), r1=30(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 30
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
