; DESCRIPTION: Places a blue circle of radius 55 at center (360, 97).
; PLAN: r0=360(x), r1=97(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 97
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
