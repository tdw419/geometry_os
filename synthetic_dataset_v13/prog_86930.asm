; DESCRIPTION: Places a blue circle of radius 10 at center (110, 225).
; PLAN: r0=110(x), r1=225(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 225
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
