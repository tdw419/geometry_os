; DESCRIPTION: Places a purple circle of radius 36 at center (346, 92).
; PLAN: r0=346(x), r1=92(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 92
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
