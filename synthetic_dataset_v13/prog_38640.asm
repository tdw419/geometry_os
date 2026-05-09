; DESCRIPTION: Places a blue circle of radius 54 at center (172, 171).
; PLAN: r0=172(x), r1=171(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 171
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
