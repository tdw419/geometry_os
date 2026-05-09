; DESCRIPTION: Places a blue circle of radius 19 at center (369, 162).
; PLAN: r0=369(x), r1=162(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 162
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
