; DESCRIPTION: Places a yellow circle of radius 35 at center (108, 187).
; PLAN: r0=108(x), r1=187(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 187
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
