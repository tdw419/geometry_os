; DESCRIPTION: Places a blue circle of radius 19 at center (223, 206).
; PLAN: r0=223(x), r1=206(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 206
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
