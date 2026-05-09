; DESCRIPTION: Places a black circle of radius 59 at center (364, 85).
; PLAN: r0=364(x), r1=85(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 85
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
