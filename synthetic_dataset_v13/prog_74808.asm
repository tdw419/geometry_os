; DESCRIPTION: Places a blue circle of radius 55 at center (82, 185).
; PLAN: r0=82(x), r1=185(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 185
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
