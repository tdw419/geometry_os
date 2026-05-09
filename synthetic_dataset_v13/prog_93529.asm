; DESCRIPTION: Places a blue circle of radius 35 at center (295, 114).
; PLAN: r0=295(x), r1=114(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 114
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
