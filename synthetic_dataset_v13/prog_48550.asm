; DESCRIPTION: Places a yellow circle of radius 65 at center (96, 101).
; PLAN: r0=96(x), r1=101(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 101
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
