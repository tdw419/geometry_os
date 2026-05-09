; DESCRIPTION: Places a blue circle of radius 57 at center (96, 195).
; PLAN: r0=96(x), r1=195(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 195
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
