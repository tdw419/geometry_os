; DESCRIPTION: Places a yellow circle of radius 67 at center (191, 91).
; PLAN: r0=191(x), r1=91(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 91
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
