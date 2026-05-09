; DESCRIPTION: Places a blue circle of radius 23 at center (187, 226).
; PLAN: r0=187(x), r1=226(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 226
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
