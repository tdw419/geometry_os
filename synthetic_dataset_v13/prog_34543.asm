; DESCRIPTION: Places a blue circle of radius 79 at center (240, 134).
; PLAN: r0=240(x), r1=134(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 134
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
