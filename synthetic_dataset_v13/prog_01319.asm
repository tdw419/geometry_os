; DESCRIPTION: Renders a purple disk with center (344, 83) and radius 71.
; PLAN: r0=344(x), r1=83(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 83
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
