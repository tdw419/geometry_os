; DESCRIPTION: Places a blue circle of radius 36 at center (209, 59).
; PLAN: r0=209(x), r1=59(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 59
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
