; DESCRIPTION: Places a purple circle of radius 38 at center (89, 42).
; PLAN: r0=89(x), r1=42(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 42
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
