; DESCRIPTION: Places a green circle of radius 47 at center (340, 155).
; PLAN: r0=340(x), r1=155(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 155
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
