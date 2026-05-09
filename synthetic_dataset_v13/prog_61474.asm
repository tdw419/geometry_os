; DESCRIPTION: Places a purple circle of radius 58 at center (157, 95).
; PLAN: r0=157(x), r1=95(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 95
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
