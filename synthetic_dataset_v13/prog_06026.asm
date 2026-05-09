; DESCRIPTION: Places a purple circle of radius 61 at center (428, 182).
; PLAN: r0=428(x), r1=182(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 182
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
