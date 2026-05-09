; DESCRIPTION: Places a yellow circle of radius 75 at center (126, 116).
; PLAN: r0=126(x), r1=116(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 116
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
