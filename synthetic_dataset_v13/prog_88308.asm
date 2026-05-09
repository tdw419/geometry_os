; DESCRIPTION: Places a purple circle of radius 67 at center (295, 116).
; PLAN: r0=295(x), r1=116(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 116
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
