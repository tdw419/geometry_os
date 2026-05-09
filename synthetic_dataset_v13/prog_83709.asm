; DESCRIPTION: Places a blue circle of radius 34 at center (251, 121).
; PLAN: r0=251(x), r1=121(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 121
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
