; DESCRIPTION: Places a yellow circle of radius 29 at center (44, 202).
; PLAN: r0=44(x), r1=202(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 202
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
