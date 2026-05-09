; DESCRIPTION: Places a blue circle of radius 74 at center (245, 89).
; PLAN: r0=245(x), r1=89(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 89
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
