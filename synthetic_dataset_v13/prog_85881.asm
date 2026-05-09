; DESCRIPTION: Places a yellow circle of radius 59 at center (350, 65).
; PLAN: r0=350(x), r1=65(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 65
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
