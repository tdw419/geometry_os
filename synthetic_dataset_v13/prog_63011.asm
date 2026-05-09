; DESCRIPTION: Places a blue circle of radius 20 at center (417, 200).
; PLAN: r0=417(x), r1=200(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 200
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
