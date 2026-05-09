; DESCRIPTION: Places a green circle of radius 52 at center (165, 131).
; PLAN: r0=165(x), r1=131(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 131
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
