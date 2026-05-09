; DESCRIPTION: Places a blue circle of radius 22 at center (344, 191).
; PLAN: r0=344(x), r1=191(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 191
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
