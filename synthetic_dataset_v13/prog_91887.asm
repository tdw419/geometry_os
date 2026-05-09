; DESCRIPTION: Places a blue circle of radius 40 at center (311, 164).
; PLAN: r0=311(x), r1=164(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 164
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
