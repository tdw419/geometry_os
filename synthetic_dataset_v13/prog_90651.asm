; DESCRIPTION: Places a blue circle of radius 70 at center (265, 162).
; PLAN: r0=265(x), r1=162(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 162
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
