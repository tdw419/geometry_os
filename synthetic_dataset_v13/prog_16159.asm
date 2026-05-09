; DESCRIPTION: Places a blue circle of radius 58 at center (267, 99).
; PLAN: r0=267(x), r1=99(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 99
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
