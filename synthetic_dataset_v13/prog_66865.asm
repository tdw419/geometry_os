; DESCRIPTION: Places a green circle of radius 59 at center (441, 89).
; PLAN: r0=441(x), r1=89(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 89
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
