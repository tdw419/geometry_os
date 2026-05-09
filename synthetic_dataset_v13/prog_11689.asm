; DESCRIPTION: Places a blue circle of radius 58 at center (350, 138).
; PLAN: r0=350(x), r1=138(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 138
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
