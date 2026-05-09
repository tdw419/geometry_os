; DESCRIPTION: Places a yellow circle of radius 62 at center (197, 92).
; PLAN: r0=197(x), r1=92(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 92
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
