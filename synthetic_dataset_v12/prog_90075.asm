; DESCRIPTION: Places a green circle of radius 25 at center (131, 43).
; PLAN: r0=131(x), r1=43(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 43
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
