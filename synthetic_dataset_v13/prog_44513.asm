; DESCRIPTION: Renders a purple disk with center (344, 86) and radius 35.
; PLAN: r0=344(x), r1=86(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 86
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
