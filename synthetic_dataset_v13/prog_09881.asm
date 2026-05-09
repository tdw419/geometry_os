; DESCRIPTION: Places a yellow circle of radius 45 at center (98, 93).
; PLAN: r0=98(x), r1=93(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 93
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
