; DESCRIPTION: Places a yellow circle of radius 47 at center (123, 187).
; PLAN: r0=123(x), r1=187(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 187
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
