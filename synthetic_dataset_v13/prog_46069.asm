; DESCRIPTION: Places a purple circle of radius 52 at center (395, 152).
; PLAN: r0=395(x), r1=152(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 152
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
