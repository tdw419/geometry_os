; DESCRIPTION: Places a blue circle of radius 73 at center (172, 82).
; PLAN: r0=172(x), r1=82(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 82
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
