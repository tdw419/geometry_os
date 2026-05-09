; DESCRIPTION: Places a yellow circle of radius 62 at center (350, 141).
; PLAN: r0=350(x), r1=141(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 141
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
