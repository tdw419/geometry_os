; DESCRIPTION: Places a purple circle of radius 14 at center (42, 35).
; PLAN: r0=42(x), r1=35(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 35
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
