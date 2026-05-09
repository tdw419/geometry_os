; DESCRIPTION: Places a blue circle of radius 47 at center (443, 81).
; PLAN: r0=443(x), r1=81(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 81
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
