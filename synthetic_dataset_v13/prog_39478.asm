; DESCRIPTION: Places a green circle of radius 48 at center (384, 145).
; PLAN: r0=384(x), r1=145(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 145
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
