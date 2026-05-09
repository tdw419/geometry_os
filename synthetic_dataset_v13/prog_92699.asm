; DESCRIPTION: Places a purple circle of radius 73 at center (295, 157).
; PLAN: r0=295(x), r1=157(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 157
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
