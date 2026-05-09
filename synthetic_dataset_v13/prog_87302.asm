; DESCRIPTION: Places a blue circle of radius 45 at center (91, 170).
; PLAN: r0=91(x), r1=170(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 170
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
