; DESCRIPTION: Places a green circle of radius 19 at center (270, 55).
; PLAN: r0=270(x), r1=55(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 55
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
