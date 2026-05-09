; DESCRIPTION: Places a blue circle of radius 38 at center (365, 106).
; PLAN: r0=365(x), r1=106(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 106
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
