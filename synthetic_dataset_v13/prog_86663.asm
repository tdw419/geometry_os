; DESCRIPTION: Places a blue circle of radius 57 at center (279, 89).
; PLAN: r0=279(x), r1=89(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 89
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
