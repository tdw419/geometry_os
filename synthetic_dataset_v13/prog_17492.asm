; DESCRIPTION: Places a blue circle of radius 21 at center (25, 196).
; PLAN: r0=25(x), r1=196(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 196
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
