; DESCRIPTION: Places a yellow circle of radius 74 at center (187, 148).
; PLAN: r0=187(x), r1=148(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 148
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
