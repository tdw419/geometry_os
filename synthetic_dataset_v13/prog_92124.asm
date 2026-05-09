; DESCRIPTION: Places a yellow circle of radius 26 at center (96, 229).
; PLAN: r0=96(x), r1=229(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 229
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
