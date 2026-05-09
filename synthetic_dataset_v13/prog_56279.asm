; DESCRIPTION: Places a blue circle of radius 18 at center (389, 91).
; PLAN: r0=389(x), r1=91(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 91
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
