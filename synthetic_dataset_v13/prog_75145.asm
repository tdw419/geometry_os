; DESCRIPTION: Places a yellow circle of radius 59 at center (194, 120).
; PLAN: r0=194(x), r1=120(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 120
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
