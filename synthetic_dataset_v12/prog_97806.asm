; DESCRIPTION: Places a green circle of radius 47 at center (237, 200).
; PLAN: r0=237(x), r1=200(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 200
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
