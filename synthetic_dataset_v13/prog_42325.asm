; DESCRIPTION: Places a purple circle of radius 59 at center (272, 120).
; PLAN: r0=272(x), r1=120(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 120
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
