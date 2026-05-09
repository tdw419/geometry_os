; DESCRIPTION: Places a yellow circle of radius 15 at center (394, 187).
; PLAN: r0=394(x), r1=187(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 187
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
