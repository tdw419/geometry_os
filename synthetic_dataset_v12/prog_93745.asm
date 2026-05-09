; DESCRIPTION: Places a yellow circle of radius 74 at center (312, 134).
; PLAN: r0=312(x), r1=134(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 134
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
