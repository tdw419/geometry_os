; DESCRIPTION: Places a blue circle of radius 14 at center (446, 184).
; PLAN: r0=446(x), r1=184(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 184
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
