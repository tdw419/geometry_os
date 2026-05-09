; DESCRIPTION: Places a purple circle of radius 21 at center (441, 42).
; PLAN: r0=441(x), r1=42(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 42
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
