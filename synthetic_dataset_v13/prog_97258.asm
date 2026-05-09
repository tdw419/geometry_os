; DESCRIPTION: Places a yellow circle of radius 21 at center (35, 65).
; PLAN: r0=35(x), r1=65(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 65
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
