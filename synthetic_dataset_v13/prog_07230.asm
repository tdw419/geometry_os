; DESCRIPTION: Places a purple circle of radius 47 at center (116, 109).
; PLAN: r0=116(x), r1=109(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 109
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
