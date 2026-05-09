; DESCRIPTION: Places a yellow circle of radius 40 at center (131, 202).
; PLAN: r0=131(x), r1=202(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 202
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
