; DESCRIPTION: Places a black circle of radius 59 at center (213, 175).
; PLAN: r0=213(x), r1=175(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 175
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
