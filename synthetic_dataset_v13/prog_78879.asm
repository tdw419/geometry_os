; DESCRIPTION: Places a yellow circle of radius 30 at center (391, 165).
; PLAN: r0=391(x), r1=165(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 165
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
