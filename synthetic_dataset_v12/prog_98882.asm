; DESCRIPTION: Places a yellow circle of radius 34 at center (209, 118).
; PLAN: r0=209(x), r1=118(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 118
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
