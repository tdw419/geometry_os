; DESCRIPTION: Places a purple circle of radius 79 at center (399, 173).
; PLAN: r0=399(x), r1=173(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 173
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
