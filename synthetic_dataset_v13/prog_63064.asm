; DESCRIPTION: Places a blue circle of radius 57 at center (446, 109).
; PLAN: r0=446(x), r1=109(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 109
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
