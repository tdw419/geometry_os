; DESCRIPTION: Places a blue circle of radius 65 at center (82, 175).
; PLAN: r0=82(x), r1=175(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 175
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
