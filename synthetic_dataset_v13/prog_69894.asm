; DESCRIPTION: Places a purple circle of radius 38 at center (74, 82).
; PLAN: r0=74(x), r1=82(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 82
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
