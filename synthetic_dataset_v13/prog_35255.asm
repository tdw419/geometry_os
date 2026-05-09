; DESCRIPTION: Places a yellow circle of radius 54 at center (172, 187).
; PLAN: r0=172(x), r1=187(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 187
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
