; DESCRIPTION: Places a green circle of radius 20 at center (111, 67).
; PLAN: r0=111(x), r1=67(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 67
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
