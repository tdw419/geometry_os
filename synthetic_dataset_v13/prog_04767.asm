; DESCRIPTION: Places a purple circle of radius 33 at center (446, 74).
; PLAN: r0=446(x), r1=74(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 74
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
