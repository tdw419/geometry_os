; DESCRIPTION: Places a blue circle of radius 66 at center (197, 70).
; PLAN: r0=197(x), r1=70(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 70
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
