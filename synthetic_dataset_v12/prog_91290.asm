; DESCRIPTION: Places a black circle of radius 33 at center (86, 198).
; PLAN: r0=86(x), r1=198(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 198
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
