; DESCRIPTION: Places a green circle of radius 60 at center (164, 163).
; PLAN: r0=164(x), r1=163(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 163
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
