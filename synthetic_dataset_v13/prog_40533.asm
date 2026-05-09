; DESCRIPTION: Places a yellow circle of radius 67 at center (264, 106).
; PLAN: r0=264(x), r1=106(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 106
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
