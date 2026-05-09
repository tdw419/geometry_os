; DESCRIPTION: Places a magenta circle of radius 59 at center (272, 84).
; PLAN: r0=272(x), r1=84(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 84
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
