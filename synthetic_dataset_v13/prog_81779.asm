; DESCRIPTION: Places a yellow circle of radius 78 at center (198, 106).
; PLAN: r0=198(x), r1=106(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 106
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
