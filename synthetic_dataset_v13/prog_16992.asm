; DESCRIPTION: Places a black circle of radius 40 at center (222, 92).
; PLAN: r0=222(x), r1=92(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 92
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
