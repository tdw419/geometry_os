; DESCRIPTION: Places a blue circle of radius 33 at center (317, 94).
; PLAN: r0=317(x), r1=94(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 94
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
