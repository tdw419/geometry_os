; DESCRIPTION: Places a blue circle of radius 65 at center (413, 168).
; PLAN: r0=413(x), r1=168(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 168
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
