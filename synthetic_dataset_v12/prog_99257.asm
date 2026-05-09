; DESCRIPTION: Places a blue circle of radius 34 at center (213, 55).
; PLAN: r0=213(x), r1=55(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 55
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
