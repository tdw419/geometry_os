; DESCRIPTION: Places a yellow circle of radius 65 at center (347, 89).
; PLAN: r0=347(x), r1=89(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 89
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
