; DESCRIPTION: Places a blue circle of radius 34 at center (82, 212).
; PLAN: r0=82(x), r1=212(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 212
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
