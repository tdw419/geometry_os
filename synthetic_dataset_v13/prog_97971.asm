; DESCRIPTION: Places a black circle of radius 34 at center (226, 54).
; PLAN: r0=226(x), r1=54(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 54
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
