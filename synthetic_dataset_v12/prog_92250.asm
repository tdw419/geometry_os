; DESCRIPTION: Places a blue circle of radius 55 at center (77, 138).
; PLAN: r0=77(x), r1=138(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 138
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
