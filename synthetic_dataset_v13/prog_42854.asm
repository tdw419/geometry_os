; DESCRIPTION: Places a green circle of radius 13 at center (38, 230).
; PLAN: r0=38(x), r1=230(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 230
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
