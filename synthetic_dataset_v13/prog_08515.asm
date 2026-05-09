; DESCRIPTION: Places a green circle of radius 17 at center (120, 39).
; PLAN: r0=120(x), r1=39(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 39
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
