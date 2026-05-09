; DESCRIPTION: Places a yellow circle of radius 19 at center (198, 49).
; PLAN: r0=198(x), r1=49(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 49
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
