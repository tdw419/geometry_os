; DESCRIPTION: Places a blue circle of radius 60 at center (178, 149).
; PLAN: r0=178(x), r1=149(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 149
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
