; DESCRIPTION: Places a purple circle of radius 29 at center (95, 141).
; PLAN: r0=95(x), r1=141(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 141
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
