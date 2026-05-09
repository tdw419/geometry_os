; DESCRIPTION: Places a yellow circle of radius 35 at center (410, 185).
; PLAN: r0=410(x), r1=185(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 185
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
