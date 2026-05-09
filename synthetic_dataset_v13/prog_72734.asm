; DESCRIPTION: Places a blue circle of radius 52 at center (206, 59).
; PLAN: r0=206(x), r1=59(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 59
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
