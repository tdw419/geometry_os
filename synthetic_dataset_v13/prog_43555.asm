; DESCRIPTION: Places a green circle of radius 14 at center (482, 136).
; PLAN: r0=482(x), r1=136(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 136
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
