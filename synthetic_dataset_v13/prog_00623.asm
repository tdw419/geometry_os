; DESCRIPTION: Places a green circle of radius 70 at center (271, 110).
; PLAN: r0=271(x), r1=110(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 110
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
